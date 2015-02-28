

//Variable per anar cap a la esqerra bala
int balax = 586;
boolean bala= true;
color rojo=#ff0000;
boolean balaa= false;
int sangre=385;
int llagrima=260;
boolean cierre= false;

void setup() {
  size(800, 650);
  frameRate(300);//blukes per segon

}

void draw(){

 
  background(#11ACEE);
 

  //cara
  stroke(#FFB45F);
  fill (#FFB45F);
  ellipse (300,340, 350, 500);
   //sombrero
   stroke(#513310);
  fill(#513310);

  
  ellipse(300,160,500,90);
  
  rect(210,80,180,100,80);
  //ulls
  stroke(#000000);
  fill(#FFFFFF);
  
  ellipse(220,265,70,80);
  ellipse(385,265,70,80);
  stroke(#937512);
  fill(#937512);
  ellipse(220,265,20,30);
  
  ellipse(385,265,20,30);
  
  
  fill(#000000);
  ellipse(220,265,10,10);
  ellipse(385,265,10,10);
  
  //nas
  stroke(#E99126);
  fill(#E99126);
 
  ellipse(300,350,30,20);
  //boca
  fill(#9D171B);
  stroke(#F3704C);
  arc(300, 420, 180, 200, 0, PI, OPEN);
 fill(#8E1115);
 stroke(#8E1115);
  ellipse(300,450,40,40);
  //orelles
  stroke(#FFB45F);
  fill (#FFB45F);
  ellipse(130,325,50,80);
  ellipse(470,325,50,80);
  fill(#000000);
  ellipse(478,325,10,20);
  fill(#000000);
  ellipse(122,325,10,20);
  //ARRACADES
  
  fill(#EED811);
  ellipse(122,360,20,20);
  ellipse(478,360,20,20);
  
  //celles
  fill(#000000);
  stroke(#000000);
 rect(195,218,45,5,80);
 rect(365,218,45,5,80);
 //pistola
 fill(#262222);
 stroke(#262222);
 rect(600,225,200,75);
 rect(585,246,40,30,5);
 fill(#ffffff);
 stroke(#ffffff);
 rect(600,235,300,2,5);
 
 //gatillo
 noFill();
stroke(#262222);

strokeWeight(10);
curve(700,150,725,301,810,364,760,250);
curve(800,300,800,300,775,333,740,310);
strokeWeight(1);
//mirilla
fill(#262222);
rect(713,215,200,15);

    rect(balax, 253, 20,15,10);
if(bala==false)
if(balax<=586&&balax>386)
balax = balax -1;
if(balax==387)

fill(#FF0000);
if(balax==387)
ellipse(387,265,70,80);
;
fill(#FF0000);
stroke(#FF0000);
if(balax==387){
 balaa=true;
}

if(balaa==true){
 ellipse(382,265,50,40);
 ellipse(382,265,50,40); 
 ellipse(382,265,50,40); 
 rect(382,265,10,25,10);

 rect(382,260,10,llagrima,10);

}

  

 if(llagrima<=260&&llagrima>=300){
  llagrima= llagrima+1; 
  
 }

println(mouseX+","+mouseY);
   
}
void mousePressed(){
  bala=false;

  
}
  


