
int monsterX;
int monsterY;

int richting;
int teller;
boolean test;
int y;


void setup(){
  size(200, 200); 
  

  monsterX = 100;
  monsterY = 100;
  
  test = true;
  richting= 5;
  teller= 0;
  y = 0;
 
  
}

void draw() {
  background(255);
   Achtergrond();
   Beweging();
   Monster();
}
  
 void Achtergrond(){
   while(y < height){
   stroke(0);
   rect(0, y, width, y);
   y = y + 10;
 }
}
  
 
 void Beweging(){ 
  
  monsterX= mouseX;
  
  if (test == true){
      fill(0,0,255);
     ellipse(monsterX-20, monsterX-20, 50, 50);
  } 
  
  if (test == false){
  }
  
 monsterY = monsterY + richting;
 if (monsterY > 200 || monsterY <0){
 richting= -richting;
 teller = teller +1;
 }
 
 if(teller == 5){
 teller = 0;
 test = !test;
 }
 
 println(teller);
 }
  
 
 void Monster(){
  
   stroke(0);
  fill(150);
  rect(monsterX-38, monsterY+2, 35, 58, 45, 45, 18, 18);        //lichaam van het monstertje
  fill(180);                                                //kleur van het buikje
  noStroke();                                               //rand van het buikje 
  rect(monsterX-34, monsterY+15, 20, 38, 45, 45, 18, 18);       //het buikje van het monstertje
 
  stroke(0);                                                //omlijning van het hoofdje
  fill(150);                                                //kleur van het hoofd
  ellipse(monsterX-20, monsterY-20, 50, 50);                    //hoofd van het monstertje
  
  fill(0);                                                  //kleur oog  
  ellipse(monsterX-35, monsterY-20, 10, 20);                    //linkeroog
  fill(0);                                                  //kleur oog
  ellipse(monsterX-20, monsterY-20, 10, 20);                    //rechteroog    
  fill(255);                                                //sparking  
  ellipse(monsterX-34, monsterY-25, 5, 5);                      //linkertwinkeling
  fill(255);                                                //sparking
  ellipse(monsterX-20, monsterY-25, 5, 5);                      //rechtertwinkeling
  
  line(monsterX-20, monsterY+60, monsterX-20, monsterY+90);         //rechtbeentje       
  line(monsterX-30, monsterY+59, monsterX-30, monsterY+90);         //linkerbeentje
  stroke(0);                                                //omlijning rechtervoetje
  fill(150);                                                //kleur rechtervoetje
  ellipse(monsterX-20, monsterY+90, 7, 7);                      //rechtervoetje
  stroke(0);                                                //omlijning linkervoetje
  fill(150);                                                //kleur linkervoetje
  ellipse(monsterX-30, monsterY+90, 7, 7);                      //linkervoetje
  
  line(monsterX-20, monsterY-45, monsterX-40, monsterY-60);         //haartje
  line(monsterX-20, monsterY-45, monsterX-20, monsterY-65);         //haartje
  line(monsterX-20, monsterY-45, monsterX-30, monsterY-63);         //haartje
  
  line(monsterX-38, monsterY+30, monsterX-55, monsterY+10);         //linkerarmpje
  line(monsterX-13, monsterY+30, monsterX+5, monsterY+10);          //rechterarmpje
  stroke(0);                                                //omlijning linkerhandje
  fill(150);                                                //kleur linkerhandje
  ellipse(monsterX-55, monsterY+10, 7, 7);                      //linkerhandje
  
  stroke(0);                                                //omlijning rechterhandje
  fill(150);                                                //kleur rechterhandje
  ellipse(monsterX+5, monsterY+10, 7, 7);                       //rechterhandje
  
 } 


