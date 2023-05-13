<#-- 
 ~ Copyright 2023 Mayeku Khisa
 ~
 ~ Use of this source code is governed by a MIT license as appearing in the
 ~ LICENSE file included in the root of this source tree.
 -->
{
   "name": "${projectName?lower_case?replace(' |_', '-', 'r')}",
   "version": "0.1.0",
   "private": true,
   "scripts": {
      "dev": "next dev",
      "build": "next build",
      "start": "next start",
      "lint": "next lint && prettier --check ./**/*.{css,js,json,yml} --ignore-path .gitignore",
      "lint:fix": "next lint --fix && prettier --write ./**/*.{css,js,json,yml} --ignore-path .gitignore"
   },
   "dependencies": {
      "next": "13.4.2",
      "react": "18.2.0",
      "react-dom": "18.2.0"
   },
   "devDependencies": {
      "@types/node": "20.1.3",
      "@types/react": "18.2.6",
      "@types/react-dom": "18.2.4",
      "autoprefixer": "10.4.14",
      "eslint": "8.40.0",
      "eslint-config-next": "13.4.2",
      "eslint-config-prettier": "8.8.0",
      "eslint-plugin-prettier": "4.2.1",
      "eslint-plugin-simple-import-sort": "10.0.0",
      "eslint-plugin-tailwindcss": "3.8.0",
      "postcss": "8.4.23",
      "tailwindcss": "3.3.2",
      "typescript": "5.0.4"
   }
}
