
//triangulo indicador//

//variable utilizada en el switch//
int b;

void setup()
{
    colorMode(RGB);
    size(400,400);
    noLoop();
    
    fill(255, 0, 0);
    triangle(134, 120, 166, 120, 181, 154);
    fill(255, 0, 0);
    text("click \naqui",134,100);
    fill(255, 0, 0);
    
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

void triangulo()
{
    fill(199, 48, 48);
    triangle(89, 34, 81, 14, 50, 37);
    text("click \naqui",95,20);  
}


void colores()
{
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
    text("5%",335,110);
    text("10%",331,75);
    text("2%", 335,40);
}

//esta en proseso//
void banda()
{
   switch(b){
       case 1:rect(180,160,10,70);
       break;
       case 2:rect(210,160,10,70);
       break;
       case 3:rect(240,160,10,70);
       break;
       case 4:rect(280,160,10,70);
   }
    
}

void draw()
{
   if(mouseX>=180 && mouseX<=190 && mouseY>=160 && mouseY<=230){
         colores();
         triangulo();
          b=1;
   }else if(mouseX>=210 && mouseX<=220 && mouseY>=160 && mouseY<=230){
         colores();
         triangulo();
          b=2;
   }else if(mouseX>=240 && mouseX<=250 && mouseY>=160 && mouseY<=230){
         colores();
         triangulo();
         b=3;
   }else if(mouseX>=280 && mouseX<=290 && mouseY>=160 && mouseY<=230){
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
         b=4;
   }
    
    if(mouseX>=10 && mouseX<=40 && mouseY>=20 && mouseY<=50){
            fill(10, 9, 9);
            banda();
    }else if(mouseX>=10 && mouseX<=40 && mouseY>=55 && mouseY<=85){
            fill(97, 63, 3);
            banda();
    }else if(mouseX>=10 && mouseX<=40 && mouseY>=90 && mouseY<=120){
            fill(255, 0, 0);
            banda();
    }else if(mouseX>=10 && mouseX<=40 && mouseY>=125 && mouseY<=155){
           fill(255, 162, 0);
            banda();
    }else if(mouseX>=10 && mouseX<=40 && mouseY>=160 && mouseY<=190){
            fill(247,255, 0);
            banda();
    }else if(mouseX>=10 && mouseX<=40 && mouseY>=195 && mouseY<=225){
            fill(68, 158, 8);
            banda();
    }else if(mouseX>=10 && mouseX<=40 && mouseY>=230 && mouseY<=260){
            fill(0, 51, 225);
            banda();
    }else if(mouseX>=10 && mouseX<=40 && mouseY>=265 && mouseY<=295){
            fill(185, 7, 230);
            banda();
    }else if(mouseX>=10 && mouseX<=40 && mouseY>=300 && mouseY<=330){
            fill(148, 142, 142);
            banda();
    }else if(mouseX>=10 && mouseX<=40 && mouseY>=335 && mouseY<=365){
            fill(250, 250, 250);
            //colores de balencia//
            banda();
    } else if(mouseX>=300 && mouseX<=330 && mouseY>=15 && mouseY<=45){
            fill(255, 0, 0);
            banda();        
    } else if(mouseX>=300 && mouseX<=330 && mouseY>=50 && mouseY<=80){
            fill(122, 122, 118);
            banda();
    } else if(mouseX>=300&& mouseX<=330 && mouseY>=85 && mouseY<=115){
           fill(148, 121, 40);
            banda();
    } else if(mouseX>=300&& mouseX<=330 && mouseY>=120 && mouseY<=150){
            fill(230, 227, 230);
            text("sin \ncolor",302,134);
            banda();
    }   
}

//precionar banda //
void mouseClicked() 
{
  redraw();
}


//pintar banda//
void mousePressed()
{
  redraw();  
}

