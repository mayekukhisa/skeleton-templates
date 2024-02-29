<#-- 
 ~ Copyright 2023-2024 Mayeku Khisa
 ~
 ~ Use of this source code is governed by a MIT license as appearing in the
 ~ LICENSE file included in the root of this source tree.
 -->
{
   "name": "${projectName?lower_case?replace('[ _]', '-', 'r')}",
   "version": "0.1.0",
   "private": true,
   "scripts": {
      "dev": "next dev",
      "build": "next build",
      "start": "next start",
      "lint": "next lint && codecap --check && prettier --check ./**/*.{css,json,mjs,yml}",
      "lint:fix": "next lint --fix && codecap --fix && prettier --write ./**/*.{css,json,mjs,yml}"
   },
   "dependencies": {
      "next": "14.1.0",
      "react": "^18",
      "react-dom": "^18"
   },
   "devDependencies": {
      "@types/node": "^20",
      "@types/react": "^18",
      "@types/react-dom": "^18",
      "codecap": "^0",
      "eslint": "^8",
      "eslint-config-next": "14.1.0",
      "eslint-config-prettier": "^9",
      "eslint-plugin-prettier": "^5",
      "eslint-plugin-simple-import-sort": "^12",
      "prettier": "^3",
      "typescript": "^5"
   }
}
