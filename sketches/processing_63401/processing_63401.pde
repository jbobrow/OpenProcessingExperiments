
int space = 5;
 
void setup() {
 
  size(100, 100);
}
 
void draw() {
  background(255);

for(float x = space; x<= width/2; x=x+5){
   line(x, 20, x, 60);
   }
    
   for(float x = space; x<= width/2; x=x+5){
   line(x+50, 40, x+50, 90);
}
}

/*space = 10;
 
void setup() {
 
  size(100, 100);
}
 
void draw() {
  background(255);

 for (float x = space; x<= width-space; x=x+10) {
    line(20, x, width/2, x);
 }
for (float x = space; x<= width-space-5; x=x+10) {
    line(width/2, x+5, width-space - 5, x+5);
  }
 
}
int space = 6;
 
void setup() {
 
  size(100, 100);
}
 
void draw() {
  background(255);

  for(float x = space; x<= width-space; x=x*1.5){
   line(x, 10, x, 80);
   }
  
}
int space = 6;
 
void setup() {
 
  size(100, 100);
}
 
void draw() {
  background(255);

  for(float y = space; y<= height-space; y=y*1.5){
   line(10, y, 80, y);
   }
  
}
size (100, 100);
background (255);

int i=20;
while(i< 80) {
  line(i, 30, i, 60);
  i = i + 5;
}



size (100, 100);
background (255);

int i=20;
while(i< 80) {
  line(30, i, 60, i);
  i = i + 5;
}



size (100, 100);
background (255);

int x=20;

while(x +20 < 80) {
  line(x, 30, x + 20, 60);
  x = x + 3;
}


size (100, 100);
background (255);

for (int y = 40; y < 80; y = y +4) {
  line(30, y , 80, y);
}
*/

