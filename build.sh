#!/bin/bash
rm -rf dist
# build with jekyll
cd corbs-cv
jekyll build
cd ..
cd corbs-blog
jekyll build
cd ..
# package cv and blog into zip file
cd corbs-cv/_site
zip -r cv.zip *
cd ../..
cd corbs-blog/_site
zip -r blog.zip *
cd ../..
# move cv and blog into dist folder
mkdir dist
mv corbs-cv/_site/cv.zip dist/
mv corbs-blog/_site/blog.zip dist/
# scp to server, will prompt for password
scp dist/blog.zip corbett@corbettworks.net:~/uploads/blog.zip
scp dist/cv.zip corbett@corbettworks.net:~/uploads/cv.zip
