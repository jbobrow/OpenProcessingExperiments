
size(400, 400);
background(0);



for (float x = 5 ; x < 400; x+=20) { //defines x with limits up to 400 and an interval of 20, and origin 5
  for (float y = 5; y<400; y+=20) {  //defines y with limits up to 400 and an interval of 20, and origin 5

    float random;
    random = random(250); //generates a random color from 0-250 on the grayscale
    fill(random);//fills random squares with colors from 0-250 on gayscale

    stroke(100);
    rect(x, y, 10, 10); // rectangle with origin (x,y) and witdth and height or 10, they are offset by 20 with the given loop above
  }
}


for (float z = 0; z<400; z+=20) {
  for (float h = 0; h<400; h+=20) {
    line(z, h, z, height);            // defines vertical lines that go between square intervals
  }
}
for (float z = 0; z<400; z+=20) {
  for (float h = 0; h<400; h+=20) {
    line(z, h, width, h);              //defines horizontal lines that go between square intervals
  }
}



