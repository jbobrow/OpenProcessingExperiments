
//this code was inspired by LeWitt’s Wall Drawing 51 also known as “All architectural points connected by straight lines.”
size(400, 400);
background(255, 0, 0);
fill(0);
rect(150, 150, 100, 100);



for (float outerLx = 0; outerLx<=400; outerLx +=100) {//this for loop and the following divide the outer limit of the canvas and an interior square into four parts along all four sides of each and connect each point with the along corresponding sides with a line
  for (float innerLx = 150; innerLx<=250; innerLx +=25) {
    line(outerLx, 0, innerLx, 150);
    line(outerLx, 400, innerLx, 250);
  }
}

for (float outerLy= 0; outerLy <=400; outerLy+=100) {
  for (float innerLy= 150; innerLy <=250; innerLy +=25) {
    line(0, outerLy, 150, innerLy);
    line(400, outerLy, 250, innerLy);
  }
}
for (float lx = 150; lx <= 250; lx += 25) {// this for loop creates a grid within the inner square based off the four points along each side the square
  for (float ly = 150; ly <= 250; ly += 25) {
    stroke(255,0,0);
    line (lx, 150, lx, 250);
    line (150, ly, 250, ly);
  }
}

