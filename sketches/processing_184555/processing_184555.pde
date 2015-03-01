
float bolita = 1;
void setup(){
  size(600,600);
}
void draw(){
  bolita = bolita+1;
  ellipse(bolita,300,10,10);
  if (bolita >30){
    ellipse(bolita,310,10,10);
     }
  if (bolita >50){
    ellipse(bolita,320,10,10);
     }
  if (bolita >70){
    ellipse(bolita,330,10,10);
     }
  if (bolita >90){
    ellipse(bolita,330,10,10);
     }
  if (bolita >110){
    ellipse(bolita,340,10,10);
     }
}
