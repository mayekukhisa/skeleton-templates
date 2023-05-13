import styles from "./page.module.css"

export default function Home(): JSX.Element {
   return (
      <main className={styles.main}>
         <p className={styles.catchphrase}>Catchphrase 😎</p>
      </main>
   )
}
