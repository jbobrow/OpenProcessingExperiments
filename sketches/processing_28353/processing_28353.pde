
int totalPts = 300;
float steps = totalPts+1;
float R;
float O;
void setup(){
  size(300, 300);
}
void draw() {
background(0);
R= random(255);
O= random(255);

 
stroke(R,O,R);
float rand = 0;
for (int i=1; i< steps; i++){
point((width/steps)*i, (height/2)+random(-rand, rand));
rand+=random(-5, 5);
}

}

