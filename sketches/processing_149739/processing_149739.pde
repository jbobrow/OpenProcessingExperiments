
int heinzzahl=0;
int time=10000; //In derVollversion: 10000
int bildschirm=2;
color blue=color(30,50,250);
color orange=color(250,100,30);
color one=blue;
color two=orange;
void setup() {

  size(750,750);
}

void draw(){
  if(bildschirm==2){
  fill(one);
  rect(0,0,750,750);
  fill(two);
  rect(125,100,500,100,10);
  fill(one);
  textSize(45);
  text("Heinzmodus Classic",155,175);
  fill(two);
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
fill(one);
  rect(0,0,750,750);
  fill(two);
  rect(125,100,500,100);
  fill(one);
  textSize(45);
  text("Heinzmodus Classic",155,175);
  if(heinzzahl>=2000){  //In der Vollversion: 2000
    fill(orange);
    textSize(40);
    text("Deine Punktzahl",220,400);
    textSize(30);
    text(heinzzahl,330,475);
    textSize(35);
    text("Du bist ein wahrer Heinz geworden!",90,550);
  }else{
    fill(orange);
    textSize(40);
    text("Deine Punktzahl",220,400);
    textSize(30);
    text(heinzzahl,330,475);
    textSize(35);
    text("Du bist eines Heinz nicht würdig!",90,550);  
    }

}

}


void mouseClicked(){
  if (time>0){
    heinzzahl++;
  }
}

void mousePressed(){
  one=orange;
  two=blue;
}
void mouseReleased(){
    one=blue;
    two=orange;

}



    


