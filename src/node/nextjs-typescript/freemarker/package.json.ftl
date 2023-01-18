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
      "@next/font": "13.1.2",
      "next": "13.1.2",
      "react": "18.2.0",
      "react-dom": "18.2.0"
   },
   "devDependencies": {
      "@types/node": "18.11.18",
      "@types/react": "18.0.27",
      "@types/react-dom": "18.0.10",
      "eslint": "8.32.0",
      "eslint-config-next": "13.1.2",
      "eslint-config-prettier": "8.6.0",
      "eslint-plugin-prettier": "4.2.1",
      "eslint-plugin-simple-import-sort": "9.0.0",
      "typescript": "4.9.4"
   }
}
