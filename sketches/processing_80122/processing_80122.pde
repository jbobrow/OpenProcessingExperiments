
void setup(){
background(0);
size(800,800);


}



void draw() {
for (int i=20; i<height ; i+=50){
  

  
/*strokeWeight(random (3));
stroke(0,240,0);
fill(random(100),random(100),random(100),0);
line(random(i),random(i),random(i),random(i));
stroke(0,0,230);
fill(random(100),random(100),random(100),0);
line(random(i),random(i),random(i),random(i));
stroke(255);
fill(random(25),random(240),random(55),20);
line(random(i),random(i),random(i),random(i));
stroke(220,0,0);
fill(random(100),random(100),random(100),0);
line(random(i),random(i),random(i),random(i));
*/
noStroke();
fill(random(25),random(240),random(55),20);
rect(random(i),random(i),random(i),random(i),random(i),random(i));
fill(random(55),random(25),random(240),20);
rect(random(i),random(i),random(i),random(i),random(i),random(i));
fill(random(240),random(55),random(25),20);
rect(random(i),random(i),random(i),random(i),random(i),random(i));
fill(255,20);
rect(random(i),random(i),random(i),random(i),random(i),random(i));

}
}

