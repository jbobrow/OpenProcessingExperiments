
int pos = 0;
 int[]bandas=[0,0,0,0];
void setup()
{
    colorMode(RGB);
    size(400,400);
    noLoop();

//resistencia//
    fill(204, 191, 106);
    rect(150,160,160,70);
    line(77,190,150,190);
    line(310,190,380,190);
//lineas//
    noFill();
    fill(255, 255, 255);
    rect(180,160,10,70);
    rect(210,160,10,70);
    rect(240,160,10,70);
    rect(280,160,10,70);
}
void triangulo2 ()
{
    fill(247, 255, 0);
    line(214,150,168,115);
    triangle(217,138,216,155,191,146);
    textSize(10);
    fill(0, 0, 255);
    text("banda de \ntolerancia \n click \n aqui",303,245);
    line(293,242,301,270);
    triangle(290,234,284,245,303,247);
}
//triangulo indicador//
void triangulo1 (){
    textSize(15);
    fill(255, 0, 0);
    line(178,148,138,118);
    triangle(164, 149, 177, 137, 185, 159);
    fill(255, 0, 0);
    text("click \naqui",134,100);
    fill(255, 0, 0);
}
void triangulo()
{
    textSize(15);
    fill(199, 48, 48);
    triangle(69, 35, 87, 17, 87, 44);
    text("click \naqui",90,20);  
}

void colores(){
        textSize(15);
        fill(0, 0, 0);
        rect(10,20,30,30);
        fill(97, 63, 3);
        rect(10,55,30,30);
        fill(255, 0, 0);
        rect(10,90,30,30);
        fill(255, 162, 0);
        rect(10,125,30,30);
        fill(247, 255, 0);
        rect(10,160,30,30);
        fill(68, 158, 8);
        rect(10,195,30,30);
        fill(0, 51, 255);
        rect(10,230,30,30);
        fill(185, 7, 230);
        rect(10,265,30,30);
        fill(148, 142, 142);
        rect(10,300,30,30);
        fill(255, 255, 255);
        rect(10,335,30,30);
        fill(13, 1, 1);
        text(0,55,40);
        text(1,55,75);
        text(2,55,110);
        text(3,55,145);
        text(4,55,180);
        text(5,55,215);
        text(6,55,250);
        text(7,55,285);
        text(8,55,320);
        text(9,55,355);
}
//pinta la banda//
void banda (){
   switch(pos){
       case 0:rect(180,160,10,70);
       break;
       case 1:rect(210,160,10,70);
       break;
       case 2:rect(240,160,10,70);
       break;
       case 3:rect(280,160,10,70);
   }
}
void draw(){
  
        //funciones generalisadoras//
       void casilla(cx, cy)
        {
            return mouseX>=cx-5 && mouseX<=cx+5 && mouseY>=cy-35 && mouseY<=cy+35;    
        };
        var cuadro = function(cx, cy)
        {
            return mouseX>=cx-15 && mouseX<=cx+15 && mouseY>=cy-15 && mouseY<=cy+15;    
        };
        
        //precionar banda 
            if(casilla(185,195)){
                   colores();
                   triangulo();
                    pos=0;
            }else if(casilla(215,195)){
                   colores();
                   triangulo();
                    pos=1;
            }else if(casilla(245,195)){
                   colores();
                   triangulo();
                    pos=2;
            }else if(casilla(285,195)){
                    textSize(15);
                    fill(250, 250, 250);
                    rect(300,120,30,30);
                    fill(255, 0, 0);
                    text("sin \ncolor",302,134);
                    fill(255, 0, 0);
                    rect(300,15,30,30);
                    fill(117, 115, 115);
                    rect(300,50,30,30);
                    fill(184, 148, 40);
                    rect(300,85,30,30);
                    fill(5, 3, 3);
                    text("5%",335,110);
                    text("10%",331,75);
                    text("2%", 335,40);
                     pos=3;
            }else if(cuadro(25,35)){
                    fill(10, 9, 9);
                    banda();
                    bandas[pos]=0;
            }else if(cuadro(25,70)){
                    fill(97, 63, 3);
                    banda();
                    bandas[pos]=1;
            }else if(cuadro(25,105)){
                    fill(255, 0, 0);
                    banda();
                    bandas[pos]=2;
            }else if(cuadro(25,140)){
                   fill(255, 162, 0);
                    banda();
                    bandas[pos]=3;
            }else if(cuadro(25,175)){
                    fill(247,255, 0);
                    banda();
                    bandas[pos]=4;
            }else if(cuadro(25,210)){
                    fill(68, 158, 8);
                    banda();
                    bandas[pos]=5;
            }else if(cuadro(25,245)){
                    fill(0, 51, 225);
                    banda();
                    bandas[pos]=6;
            }else if(cuadro(25,280)){
                    fill(185, 7, 230);
                    banda();
                    bandas[pos]=7;
            }else if(cuadro(25,315)){
                    fill(148, 142, 142);
                    banda();
                    bandas[pos]=8;
            }else if(cuadro(25,350)){
                    fill(250, 250, 250);
                    banda();
                    bandas[pos]=9;
        //colores de valencia//
            } else if(cuadro(315,30)){
                    fill(255, 0, 0);
                    banda();
                    bandas[pos]= 0.2;
            } else if(cuadro(315,65)){
                    fill(122, 122, 118);
                    banda();
                    bandas[pos]=1;
            } else if(cuadro(315,100)){
                   fill(148, 121, 40);
                    banda();
                    bandas[pos]=0.5;
            } else if(cuadro(315,135)){
                    fill(255, 255, 255);
                    banda();
                    bandas[pos]=0;
            } else{
                
                 triangulo1();
                 triangulo2();
             }
         
        }
//precionar banda //
void mouseClicked()
{
  redraw();
}



//para el println//
 void mousePressed (){
 println(bandas);
 };
//Cuadro Resultado//
void draw (){
    fill(250, 247, 247);
    rect(146,292,238,44);
    textSize(30);
fill(18, 29, 235);
text(bandas +"   K",199,322);
noFill();
rect(146,292,238,44);
//para el reinicio proceso
if (mouseClicked===12,40){
   
}
    
};
