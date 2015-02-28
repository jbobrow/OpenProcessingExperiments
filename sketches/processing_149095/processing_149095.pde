
int heinzzahl=0;
int time=10000;
int bildschirm=2;
void setup() {

  size(750,750);
}

void draw(){
  if(bildschirm==2){
  fill(30,50,250);
  rect(0,0,750,750);
  fill(250,100,30);
  rect(125,100,500,100);
  fill(30,50,250);
  textSize(45);
  text("Heinzmodus Classic",155,175);
  fill(250,100,30);
  text("Punktzahl:",260,450);  
  text(heinzzahl,350,500);
  text("X",30,680);
  text("Y",690,680);
  text(mouseX,5,730);
  text(mouseY,660,730);
  if(mousePressed&&mouseX==42&&mouseY==42&&time>0){
    heinzzahl++;
  }
  if(time>=0){
    time=time-2;
 text(time/100,675,50);   
  }
}

if(time==0){
  bildschirm++;
}
//Auswertung:
if(bildschirm==3){
fill(30,50,250);
  rect(0,0,750,750);
  fill(250,100,30);
  rect(125,100,500,100);
  fill(30,50,250);
  textSize(45);
  text("Heinzmodus Classic",155,175);
  if(heinzzahl>=2000){
    fill(250,100,30);
    textSize(40);
    text("Deine Punktzahl",220,400);
    textSize(30);
    text(heinzzahl,330,475);
      }
    }

}




void mouseClicked(){
  if (time>0){
    heinzzahl++;
  }
}





    


