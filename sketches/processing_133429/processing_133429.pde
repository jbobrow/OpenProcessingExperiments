
size(400, 400);
background(0);

//starting with white and ending with white to overlap the colors
stroke(255);
//starting a at 20 and ending it at 380 to give a 20 unit black boarder to the image
//each lines endpoint to move 20 units along the x axis each time
//lines to start in upper left corner
for (int a = 20; a <= 380; a += 20) {
  line(20, 20, a, 380);
}
//lines to start in bottom left corner
//ending points move right along the top
stroke (0, 255, 0);
for (int d = 20; d <= 380; d += 20) {
  line(20, 380, d, 20);
}
//lines to start in upper right corner
//ending points move left along the bottom
for ( int s =380; s >= 20; s -= 20){
line(380, 20, s, 380);
}
//lines to start in bottom right corner
//ending points move left along the top
stroke(255);
for (int f =380; f >= 20; f -= 20){
  line(380, 380, f, 20);
}



