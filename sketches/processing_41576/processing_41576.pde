
int x; int y; int velocityx; int velocityy; int me; int now; int m; int n; int s;
void setup () {
  size(800,700); x = 40; y = 40; velocityx = 5; velocityy = 3; m = 760; n = 660; me = 3; now = 5;
}

void draw () {
  background(150); 
        
  for (int i = 0; i < 800; i = i+50) {
    for (int j = 0; j < 700; j = j+50) {
      fill(#7A0BD6);rect(i, j, 50, 50); fill(255,247,3); rect(j, i, 50, 50);
    }
  }
  // green ball
  fill(3,202,55); ellipse (x, y, 80, 80); x += velocityx; y += velocityy; if(x > width - 40 || x < 40 ) {velocityx *= -1;} if (y > height - 40 || y < 40) {velocityy *= -1;}
 
  //black ball
  fill(0); ellipse (m, n, 80, 80); m += me; n += now; if(m > width - 40 || m < 40) {me *= -1;} if (n > height -40 || n < 40) {now *= -1;}
  
  if(velocityy < 0) {
    for (int i = 0; i < 800; i = i+50) {
      for (int j = 0; j < 700; j = j+50) {
        fill(255,247,3);rect(i, j, 50, 50); fill(#7A0BD6); rect(j, i, 50, 50);
    }
  }
  } 
fill(3,202,55); ellipse (x, y, 80, 80); x += velocityx; y += velocityy; if(x > width - 40 || x < 40 ) {velocityx *= -1;} if (y > height - 40 || y < 40) {velocityy *= -1;}
    fill(0); ellipse (m, n, 80, 80); m += me; n += now; if(m > width - 40 || m < 40) {me *= -1;} if (n > height -40 || n < 40) {now *= -1;}
  
    }
  


