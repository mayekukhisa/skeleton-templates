using Godot;

public partial class Tag : Node2D {
   [Export]
   public AnimationPlayer TagAnimation { get; set; }

   public override void _Ready() {
      CenterTag();
      TagAnimation?.Play(name: "bob");

      GetViewport().Connect(
         signal: "size_changed",
         callable: new Callable(target: this, method: nameof(CenterTag))
      );
   }

   private void CenterTag() {
      Position = GetViewportRect().Size / 2;
   }
}
