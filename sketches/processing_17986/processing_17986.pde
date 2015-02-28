
float D, V;
float counter=1;
 
void setup(){
size(250,250);
background(0);
}
 
void draw(){
fill(255,100);
strokeWeight(1.5);
stroke(1.5);
for(int i=4; i<counter; i++){
 D= random(width);
 V= random(height);

rect(D-1,V,D+5,V);
ellipse(D,V-5,D,V+2);
ellipse(D-15,V-5,D+5,V-9);
ellipse(D+1, V-5,D-5,V-6);
}
counter++;
}

