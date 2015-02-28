
void setup(){
  size(400,200);
  noStroke();  
}

void draw (){ 
  background(255);
int i = 0;
    //Paraigües.
    fill(#278E2E);
    rect(0,170,400,30);
    //Bucle.
  while(i <= 400){
    //Arc del paraigües.
    fill(0);
    arc(175,91,150,90,3.14,6.29);
    //Treure pluja.
    fill(255);
    rect(101,90,149,80);
    //Pal del paraigües.
    fill(0);
    rect(173,35,5,97);
    ellipse(168,135,20,20);
    fill(255);
    ellipse(168,130,10,20);
    //Pluja.
    fill(random(180));
    rect(i,0,mouseX/100,170);
    i=i+5;
  }
}

