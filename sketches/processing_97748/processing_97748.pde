
// Rafael - Reforço 05

size(200, 200);
background(255);
noStroke();
colorMode(HSB, 25); 

for (int r= 0; r<200; r++) {
  for (int s = 0; s<200; s++) {
    stroke(r*r/500, s*s/500, 50);
    point(r, s);
  }
} //efeito no fundo!

int t=5;
int u=5;
stroke(0);
strokeWeight(2);
for (t=75; t<200; t=t+20) {
  line(t, u, 180, 20); 
  line(25, 25, -t+200, u); 
  u=u+25;
}
