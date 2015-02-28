
/*Nau espacial que rebota. (he aconseguit que reboti als costats per la banda de la dreta, però per l'esquerra no..no se com fer-ho. 
Quan pulses el cursor la bola de dalt de la nau, que va canviant de  mida, canvia de color, i el Sol canvia de mida quan pulses el cursor.
Quan movem el ratoli a esquerra i dreta, els dos planetes canvien de color.*/

int sz=10;
int posX,posY; /*ho poso tot en funcio de posX i posY per a tenir més fàcil programar les velocitats*/
int velX,velY;

float midaMaxima=70; /*per que vagi canviant el tamany de la bola gran*/
float midaBola=30;
float velBola=0.25;

int estat = 1; /*Per al canvi de color de la bola gran*/
color value=color(42,255,28);

int midaSol=50; /*mida inicial del Sol*/

void setup(){
  size(800,700);
  background(15,20,26);
  velX=int(random(1,8));
  velY=2;
}

void draw(){
  background(0);
/*les dues posicions estan en funcio de la velocitat, per tant es moura en ambdues posicions*/  
posX=posX+velX;
posY=posY+velY;

/*dibuixo el Sol*/
fill(255,201,3);
stroke(255,28,3);
strokeWeight(4);
ellipse(600,200,midaSol,midaSol); 

/*dibuixo els planetes. Canvaran de color conforme mogui el ratoli a esquerra,dreta,amunt o aball*/
fill(mouseX,mouseY,3); /*planeta 1*/
stroke(144,144,144);
strokeWeight(4);
ellipse(200,200,100,100); 
fill(mouseY,mouseX,58); /*planeta 2*/
stroke(144,144,144);
strokeWeight(2);
ellipse(750,500,150,200); 

/*Dibuixem la nau*/
fill(161,165,167);
noStroke();
strokeWeight(2);
triangle(posX-100,posY+75,posX,posY,posX+100,posY+75);/*triangle*/

fill(88,97,103);
stroke(88,97,103);
strokeWeight(2);
line(posX,posY-50,posX,posY);/*line*/
line(posX,posY-50,posX,posY);

fill(24,103,180); 
stroke(17,60,103);
strokeWeight(2);
ellipse(posX,posY,sz,sz);/*cercle petit (c)*/

fill(value); 
stroke(255,255,255);
strokeWeight(4);
ellipse(posX,posY-50,midaBola,midaBola);/*cercle gran (C)*/


/*defineixo la velocitat que tindra el cercle gran i el limit de la seva mida*/
midaBola=midaBola+velBola;
if (midaBola>=midaMaxima){
      midaBola=10;}

/*definim les velocitats respecte la posició*/
if((posX<=0)||(posX>=width-100)){
    velX = -velX;
  } 
if((posY<=0)||(posY>=height-75)){
    velY = -velY;
}

}

void mousePressed() {
  if (estat == 1) {  
    estat = 2; 
    value = color(42,255,28); 
    
  } else { 
   if (estat == 2) {  
   estat = 3; 
   value = color(50,0,255); 
 } else { 
   if (estat == 3) {  
   estat = 4; 
   value = color(255,28,3); 
   
   } else { 
   if (estat == 4) { 
   estat = 1; //vull anar a l'estat 1, a l'inici
   value = color(255,255,0); 
   }  
   }
 }
}
/*Estableixo que la mida del Sol sigui una variable, que li vagi sumant 10 unitats a cada click, fins que arribi a 250, que llavors tornara a la mida original, 50*/
if (midaSol==midaSol) {midaSol=midaSol+10;}
if (midaSol>=250) {midaSol=50;}

}
   



