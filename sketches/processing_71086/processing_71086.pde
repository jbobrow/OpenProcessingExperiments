
void setup(){

size(900,600);
background(0); 
//noStroke();
}
void draw(){
  
for(int i=300; i<height; i+=10){
  for(int a=450; a<width; a+=10){
   stroke(0);
   strokeWeight(2);
   fill(random(255),random(158),random(0));
 rect(random(a),random(i),random(30),random(30));
  
}
}

for(int i=300; i<height; i+=40){
  for(int a=450; a<width; a+=40){
    stroke(255,100);
//line(random(a),random(i),random(a),random(i));

  }
}
 }


