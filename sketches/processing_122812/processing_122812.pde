
void setup() {
  size(200, 200);                                    
}

void draw() {
  background(255, 255, 255);
  stroke(0);
  fill(150);
  rect(mouseX-38, mouseY+2, 35, 58, 45, 45, 18, 18);        //lichaam van het monstertje
  fill(180);                                                //kleur van het buikje
  noStroke();                                               //rand van het buikje 
  rect(mouseX-34, mouseY+15, 20, 38, 45, 45, 18, 18);       //het buikje van het monstertje
  stroke(0);                                                //omlijning van het hoofdje
  fill(150);                                                //kleur van het hoofd
  ellipse(mouseX-20, mouseY-20, 50, 50);                    //hoofd van het monstertje
  fill(0);                                                  //kleur oog  
  ellipse(mouseX-35, mouseY-20, 10, 20);                    //linkeroog
  fill(0);                                                  //kleur oog
  ellipse(mouseX-20, mouseY-20, 10, 20);                    //rechteroog    
  fill(255);                                                //sparking  
  ellipse(mouseX-34, mouseY-25, 5, 5);                      //linkertwinkeling
  fill(255);                                                //sparking
  ellipse(mouseX-20, mouseY-25, 5, 5);                      //rechtertwinkeling
  line(mouseX-20, mouseY+60, mouseX-20, mouseY+90);         //rechtbeentje       
  line(mouseX-30, mouseY+59, mouseX-30, mouseY+90);         //linkerbeentje
  stroke(0);                                                //omlijning rechtervoetje
  fill(150);                                                //kleur rechtervoetje
  ellipse(mouseX-20, mouseY+90, 7, 7);                      //rechtervoetje
  stroke(0);                                                //omlijning linkervoetje
  fill(150);                                                //kleur linkervoetje
  ellipse(mouseX-30, mouseY+90, 7, 7);                      //linkervoetje
  line(mouseX-20, mouseY-45, mouseX-40, mouseY-60);         //haartje
  line(mouseX-20, mouseY-45, mouseX-20, mouseY-65);         //haartje
  line(mouseX-20, mouseY-45, mouseX-30, mouseY-63);         //haartje
  line(mouseX-38, mouseY+30, mouseX-55, mouseY+10);         //linkerarmpje
  line(mouseX-13, mouseY+30, mouseX+5, mouseY+10);          //rechterarmpje
  stroke(0);                                                //omlijning linkerhandje
  fill(150);                                                //kleur linkerhandje
  ellipse(mouseX-55, mouseY+10, 7, 7);                      //linkerhandje
  stroke(0);                                                //omlijning rechterhandje
  fill(150);                                                //kleur rechterhandje
  ellipse(mouseX+5, mouseY+10, 7, 7);                       //rechterhandje
}

