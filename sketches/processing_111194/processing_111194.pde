
void setup(){
size(700,470);}

void draw(){
  background(85,74,74);
  
 for (int c=1; c<700; c+=1){

stroke(c/5,78,89);
line(0,c,1000,c);}
stroke(0);

fill (5);
rect (615,410,5,61); //arvores//tronco/
rect (525,410,5,65); //arvores//tronco/


ellipse (615,360,130,110); //copa//
ellipse (525,360,130,110); //copa//


  
fill(255);
noStroke();
 fill(59,59,59);
rect(0,0,500,500); //predio

stroke(5);
strokeWeight (7);

  
  fill(241,245,77);
  
  rect(mouseX/80+30, mouseY/80+150, 40,30); //janela1
  rect(mouseX/85+90, mouseY/115+100, 65,80); //janela2
  rect(mouseY/83+180, mouseX/115+120, 80,60); //janela3
  rect(mouseX/84+170, mouseY/116+25, 65,80); //janela4
  rect(mouseY/88+35, mouseX/115+210, 65,130); //janela5
  rect(mouseY/90+110, mouseX/115+220, 60,90); //janela6
  rect(mouseX/120+190, mouseY/117+210, 100,140); //janela7
  rect(mouseY/20+300, mouseX/115+210, 70,140); //janela8
  rect(mouseY/120+370, mouseX/125+150, 60,30); //janela9
  rect(mouseX/120+350, mouseY/130+30, 30,20); //janela10
  rect(mouseY/95+260, mouseX/120+75, 60,30); //janela11
  rect(mouseY/100+270, mouseX/125+10, 10,10); //janela12
  rect(mouseX/100+440, mouseY/130+45, 16,75); //janela13
  rect(mouseX/100+410, mouseY/113+250, 60,40); //janela14
  rect(mouseY/100+30, mouseX/125+40, 30,25); //janela15
  
 

  
}
