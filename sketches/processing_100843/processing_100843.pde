
// escala_de_grises

int ix = 0;
int iy= 0;
int grey = 256;
void setup() {
  size(1024, 600);
  background(255);
  noLoop();
}


void draw() {


// Greyscale SWATCHES 8 columns, 32 rows

for (int ix = 24; ix<width; ix+=125) {
for (int iy = 15; iy < 590; iy+=18)
{
rect(ix,iy,80,15);
// grey value decreases by 1
grey--;
println(grey);
fill(grey);
}
   }

}


