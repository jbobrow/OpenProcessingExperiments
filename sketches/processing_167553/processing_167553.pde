
float pos = 15;//posició relació espai.
int colors = 1;
void setup(){
 
size(255,255);
}
 
void draw() {
  
//color fondo  
  background(37,157,19);
  
//pel 
stroke(#EA9C34);
fill(#342006);
ellipse(mouseX,mouseY-60,pos+2,pos+2);//pel
ellipse(mouseX,mouseY-45,pos+12,pos+12);//pel

  
//cos
fill(234,156,colors);
stroke(#EA9C34);
   
strokeWeight(1);
 ellipse(mouseX-20,mouseY-10,pos+20,pos-10);//brazo
 ellipse(mouseX+20,mouseY-10,pos+20,pos-10);//brazo
 
 ellipse(mouseX-60,mouseY-10,pos+20,pos-10);//antebrazo
 ellipse(mouseX+60,mouseY-10,pos+20,pos-10);//antebrazo 
 
 ellipse(mouseX-10,mouseY+50,pos-10,pos+20);//camaE
 ellipse(mouseX+10,mouseY+50,pos-10,pos+20);//camaD
 
 ellipse(mouseX-10,mouseY+80,pos-10,pos+20);//antecama
 ellipse(mouseX+10,mouseY+80,pos-10,pos+20);//antecama 
 
 ellipse(mouseX,mouseY+10,pos+10,pos+50);//cos 
 
 ellipse(mouseX,mouseY-40,pos+7,pos+7);//cap
 
 //teta
 
 fill(234,156,colors);
stroke(#715C0F);
strokeWeight(1);
 
 ellipse(mouseX-13,mouseY-2,pos,pos);//teta1
 ellipse(mouseX+13,mouseY-2,pos,pos);//teta2
 
 
 //boca
fill(250,8,40);
stroke(#EA9C34);
ellipse(mouseX,mouseY-30,pos/2-1,pos/2-6);//morro 

  
 
//mugrons
 fill(33,23,colors);
stroke(#EA9C34);
strokeWeight(4);
 pos= 01+mouseY*0.1;
 ellipse(mouseX-pos-12,mouseY-1,3,3);//teta1
 pos= 01+mouseY*0.1;
 ellipse(mouseX+pos+12,mouseY-1,3,3);//teta2
 
//melic
 fill(33,23,colors);
stroke(#EA9C34);
 ellipse(mouseX,mouseY+24,3,3);//teta1
 
  
//face
fill(33,23,colors);
stroke(#FCFAF0);
strokeWeight(2);
 pos= 01+mouseY*0.1;//escala ull pos
 ellipse(mouseX+pos+1,mouseY-42,5,5);//ull1
 pos= 01+mouseY*0.1;//escala ull pos
 ellipse(mouseX-pos-1,mouseY-42,5,5);//ull2
 
 colors = 1+mouseY;
 pos= 4+mouseX/5;
}

//com posicionar en diagonal una elpise?
//com bloquejar ordres sence tenirles que ordenar?


