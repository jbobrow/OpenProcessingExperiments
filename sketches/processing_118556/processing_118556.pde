
int posy1=140; //variables para el movimiento de los cuernos
int posy2=140; 
int colorbackground = color (255); //variable para despues poder canviar el color

void setup(){ 
  size(700,600);
} 

void draw(){ 
  
   background(colorbackground); 
   fill(255, 204, 102); 
   ellipse(350, 300, 450, 500); 
   
   // Orejas  
   fill(255, 204, 102);
   ellipse(585, 300, 50, 170); 
   ellipse(115, 300, 50, 170); 
   
   // Ojos 
    fill(255, 255, 255);
    ellipse(random(455,465),random(245,255), 100, 50); 
    ellipse(random(245,255), random(245,255), 100, 50); 
    fill(255, 0, 0);
    ellipse(random(455,465), random(245,255), 40, 40); 
    ellipse(random(245,255), random(245,255), 40, 40);  
    
    // Zejas 
    fill(0, 0, 0); 
    line(320, 200, 255, 150);
    line(320, 200, 255, 150);
    line(320, 200, 255, 150);
    line(320, 200, 255, 150);
    line(320, 200, 255, 150);
    line(320, 200, 255, 150);
    line(320, 200, 255, 150);
    line(320, 200, 255, 150);
    line(320, 200, 255, 150);
    line(320, 200, 255, 150);
    line(320, 200, 255, 150);
    line(320, 200, 255, 150); 
    line(320, 200, 255, 150);
    line(320, 200, 255, 150);
    line(320, 200, 255, 150);
    line(320, 200, 255, 150);
    line(320, 200, 255, 150);
    line(320, 200, 255, 150); 
    line(320, 200, 255, 150);
    line(320, 200, 255, 150);
    line(320, 200, 255, 150);
    line(320, 200, 255, 150);
    line(320, 200, 255, 150);
    line(320, 200, 255, 150);
    line(320, 200, 255, 150); 
    line(320, 200, 255, 150);
    line(320, 200, 255, 150);
    line(320, 200, 255, 150);
    line(320, 200, 255, 150);
    line(320, 200, 255, 150);
    line(320, 200, 255, 150);
    
    line(400, 200, 465,150); 
    line(400, 200, 465,150); 
    line(400, 200, 465,150); 
    line(400, 200, 465,150); 
    line(400, 200, 465,150); 
    line(400, 200, 465,150); 
    line(400, 200, 465,150);
    line(400, 200, 465,150); 
    line(400, 200, 465,150); 
    line(400, 200, 465,150); 
    line(400, 200, 465,150); 
    line(400, 200, 465,150); 
    line(400, 200, 465,150); 
    line(400, 200, 465,150); 
    line(400, 200, 465,150); 
    line(400, 200, 465,150); 
    line(400, 200, 465,150); 
    line(400, 200, 465,150); 
    line(400, 200, 465,150); 
    line(400, 200, 465,150); 
    line(400, 200, 465,150);
    line(400, 200, 465,150); 
    line(400, 200, 465,150); 
    line(400, 200, 465,150); 
    line(400, 200, 465,150); 
    line(400, 200, 465,150); 
    line(400, 200, 465,150); 
    line(400, 200, 465,150); 
    line(400, 200, 465,150);
    line(400, 200, 465,150); 
    line(400, 200, 465,150); 
    line(400, 200, 465,150); 
    line(400, 200, 465,150); 
    line(400, 200, 465,150); 
    line(400, 200, 465,150); 
    line(400, 200, 465,150); 
    
    // Nariz 
    
    line(400, 350, 380, 240); 
    line(320, 350, 340, 240); 
    ellipse(random(341,345),random(343,347), 20, 20); 
    ellipse(random(375,379),random(343,347), 20, 20); 
    line(320, 245, 340, 205);
    line(397, 245, 380, 205); 
    
    // Boca 
    fill(255);
    rect(303, 445, 110, 30); 
    line(326, 475, 326, 445);
    line(357, 475, 357, 445); 
    line(390, 475, 390, 445); 
    line(303, 460, 413, 460); 
    
    // Barba en general (bigote, perilla...) 
    fill(0);
    rect(320, 395, 75, 25);
    triangle(320, 395, 320, 420, 260, 440);
    triangle(395, 395, 395, 420, 450, 440); 
    triangle(340, 500, 375, 500, 355, 550); 
    
    // Gorro 
    
    ellipse(350, 75, 400, 55); 
    fill(255,0,0);
    triangle(340, 55, 375, 55, 355, 20); 
    
    // cuernos
    
    triangle(400, posy1,490 , posy1, 440,posy2);
    triangle(215, posy1,300, posy1,250, posy2);
    if (posy2<=140&&posy2>=5){
    posy2=posy2-1; 
    }
 
}

void mousePressed (){
  colorbackground = color (0);
  
}

//Si apretes en diferents llocs del recuadre amb el ratoli surtira de difrents colors
void mouseReleased(){
colorbackground = color (mouseX,mouseY,100);

}


