
void setup(){
  size(640,510);                                                                //tamaño pantalla
  background(255,245,167);                                                      //color de fondo
  strokeWeight(5);                                                              //ancho lineas base
  line (213,20,213,460);                                                        //linea
  line (426,20,426,460);                                                        //linea    
  line (20,160,620,160);                                                        //linea
  line (20,320,620,320);                                                        //linea
  fill(0);                                                                      //color boton negro
  quad(480,480,480,530,640,530,640,480);                                        //boton
  fill(255);                                                                    //color letra
  textSize(40);                                                                 //tamaño letra
  text("RESET",500,510);                                                        //texto
}
int click=0;                                                                    //variable click
int cuad1=0;                                                                    //variable cuadrado1
int cuad2=0;                                                                    //variable cuadrado2
int cuad3=0;                                                                    //variable cuadrado3
int cuad4=0;                                                                    //variable cuadrado4
int cuad5=0;                                                                    //variable cuadrado5
int cuad6=0;                                                                    //variable cuadrado6
int cuad7=0;                                                                    //variable cuadrado7  
int cuad8=0;                                                                    //variable cuadrado8
int cuad9=0;                                                                    //variable cuadrado9
int res1=0;                                                                     //variable resultado cuad1
int res2=0;                                                                     //variable resultado cuad2
int res3=0;                                                                     //variable resultado cuad3
int res4=0;                                                                     //variable resultado cuad4
int res5=0;                                                                     //variable resultado cuad5
int res6=0;                                                                     //variable resultado cuad6
int res7=0;                                                                     //variable resultado cuad7
int res8=0;                                                                     //variable resultado cuad8
int res9=0;                                                                     //variable resultado cuad9
 
void draw(){println(mouseY);}                                                   //valor de click en consolta
  void mouseClicked(){                                                          //condicional mouse
    if(mouseX>480 && mouseY>480){                                               //condicional reset
        cuad1=0;                                                                //cuad1 valor iniciar
        cuad2=0;                                                                //cuad2 valor iniciar
        cuad3=0;                                                                //cuad3 valor iniciar
        cuad4=0;                                                                //cuad4 valor iniciar
        cuad5=0;                                                                //cuad5 valor iniciar
        cuad6=0;                                                                //cuad6 valor iniciar
        cuad7=0;                                                                //cuad7 valor iniciar
        cuad8=0;                                                                //cuad8 valor iniciar
        cuad9=0;                                                                //cuad9 valor iniciar
        res1=0;                                                                 //res1 valor inicial
        res2=0;                                                                 //res2 valor inicial
        res3=0;                                                                 //res3 valor inicial
        res4=0;                                                                 //res4 valor inicial
        res5=0;                                                                 //res5 valor inicial
        res6=0;                                                                 //res6 valor inicial
        res7=0;                                                                 //res7 valor inicial
        res8=0;                                                                 //res8 valor inicial
        res9=0;                                                                 //res9 valor inicial
        background(255,245,167);                                                //color de fondo
        strokeWeight(5);                                                        //ancho lineas base
        stroke(0);                                                              //color lineas
        line (213,20,213,460);                                                  //linea
        line (426,20,426,460);                                                  //linea    
        line (20,160,620,160);                                                  //linea
        line (20,320,620,320);                                                  //linea
        fill(0);                                                                //color boton negro
        quad(480,480,480,530,640,530,640,480);                                  //boton
        fill(255);                                                              //color letra
        textSize(40);                                                           //tamaño letra
        text("RESET",500,510);                                                  //texto
        click=0;                                                                //click valor inicial
    }
    if(res1==1 && res2==1 && res3==1){                                          //condicional circulo cuad1,2 y 3
      strokeWeight(5);                                                          //ancho de linea
      stroke(0,150,0);                                                          //color linea
      line(20,75,620,75);                                                       //linea
      cuad1=1;                                                                  //deshabilita cuad1
      cuad2=1;                                                                  //deshabilita cuad2
      cuad3=1;                                                                  //deshabilita cuad3
      cuad4=1;                                                                  //deshabilita cuad4
      cuad5=1;                                                                  //deshabilita cuad5
      cuad6=1;                                                                  //deshabilita cuad6
      cuad7=1;                                                                  //deshabilita cuad7
      cuad8=1;                                                                  //deshabilita cuad8
      cuad9=1;                                                                  //deshabilita cuad9
      click=0;                                                                  //click valor inicial
    }
    if(res4==1 && res5==1 && res6==1){                                          //condicional circulo cuad4,5 y 6
      strokeWeight(5);                                                          //ancho de linea
      stroke(0,150,0);                                                          //color linea
      line(20,237,620,237);                                                     //linea
      cuad1=1;                                                                  //deshabilita cuad1
      cuad2=1;                                                                  //deshabilita cuad2
      cuad3=1;                                                                  //deshabilita cuad3
      cuad4=1;                                                                  //deshabilita cuad4
      cuad5=1;                                                                  //deshabilita cuad5
      cuad6=1;                                                                  //deshabilita cuad6
      cuad7=1;                                                                  //deshabilita cuad7
      cuad8=1;                                                                  //deshabilita cuad8
      cuad9=1;                                                                  //deshabilita cuad9
      click=0;                                                                  //click valor inicial
    }
    if(res7==1 && res8==1 && res9==1){                                          //condicional circulo cuad7,8 y 9
      strokeWeight(5);                                                          //ancho de linea
      stroke(0,150,0);                                                          //color linea
      line(20,400,620,400);                                                     //linea
      cuad1=1;                                                                  //deshabilita cuad1
      cuad2=1;                                                                  //deshabilita cuad2
      cuad3=1;                                                                  //deshabilita cuad3
      cuad4=1;                                                                  //deshabilita cuad4
      cuad5=1;                                                                  //deshabilita cuad5
      cuad6=1;                                                                  //deshabilita cuad6
      cuad7=1;                                                                  //deshabilita cuad7
      cuad8=1;                                                                  //deshabilita cuad8
      cuad9=1;                                                                  //deshabilita cuad9
      click=0;                                                                  //click valor inicial
    }
    if(res1==1 && res4==1 && res7==1){                                          //condicional circulo cuad1,4 y 7
      strokeWeight(5);                                                          //ancho de linea
      stroke(0,150,0);                                                          //color linea
      line(106,20,106,460);                                                     //linea
      cuad1=1;                                                                  //deshabilita cuad1
      cuad2=1;                                                                  //deshabilita cuad2
      cuad3=1;                                                                  //deshabilita cuad3
      cuad4=1;                                                                  //deshabilita cuad4
      cuad5=1;                                                                  //deshabilita cuad5
      cuad6=1;                                                                  //deshabilita cuad6
      cuad7=1;                                                                  //deshabilita cuad7
      cuad8=1;                                                                  //deshabilita cuad8
      cuad9=1;                                                                  //deshabilita cuad9
      click=0;                                                                  //click valor inicial
    }
    if(res2==1 && res5==1 && res8==1){                                          //condicional circulo cuad2,5 y 8
      strokeWeight(5);                                                          //ancho de linea
      stroke(0,150,0);                                                          //color linea
      line(320,20,320,460);                                                     //linea
      cuad1=1;                                                                  //deshabilita cuad1
      cuad2=1;                                                                  //deshabilita cuad2
      cuad3=1;                                                                  //deshabilita cuad3
      cuad4=1;                                                                  //deshabilita cuad4
      cuad5=1;                                                                  //deshabilita cuad5
      cuad6=1;                                                                  //deshabilita cuad6
      cuad7=1;                                                                  //deshabilita cuad7
      cuad8=1;                                                                  //deshabilita cuad8
      cuad9=1;                                                                  //deshabilita cuad9
      click=0;                                                                  //click valor inicial 
    }
    if(res3==1 && res6==1 && res9==1){                                          //condicional circulo cuad3,6 y 9
      strokeWeight(5);                                                          //ancho de linea
      stroke(0,150,0);                                                          //color linea
      line(532,20,532,460);                                                     //linea
      cuad1=1;                                                                  //deshabilita cuad1
      cuad2=1;                                                                  //deshabilita cuad2
      cuad3=1;                                                                  //deshabilita cuad3
      cuad4=1;                                                                  //deshabilita cuad4
      cuad5=1;                                                                  //deshabilita cuad5
      cuad6=1;                                                                  //deshabilita cuad6
      cuad7=1;                                                                  //deshabilita cuad7
      cuad8=1;                                                                  //deshabilita cuad8
      cuad9=1;                                                                  //deshabilita cuad9
      click=0;                                                                  //click valor inicial
    }
    if(res1==1 && res5==1 && res9==1){                                          //condicional circulo cuad1,5 y 9
      strokeWeight(5);                                                          //ancho de linea
      stroke(0,150,0);                                                          //color linea
      line(20,20,620,460);                                                      //linea
      cuad1=1;                                                                  //deshabilita cuad1
      cuad2=1;                                                                  //deshabilita cuad2
      cuad3=1;                                                                  //deshabilita cuad3
      cuad4=1;                                                                  //deshabilita cuad4
      cuad5=1;                                                                  //deshabilita cuad5
      cuad6=1;                                                                  //deshabilita cuad6
      cuad7=1;                                                                  //deshabilita cuad7
      cuad8=1;                                                                  //deshabilita cuad8
      cuad9=1;                                                                  //deshabilita cuad9
      click=0;                                                                  //click valor inicial
    }
    if(res3==1 && res5==1 && res7==1){                                          //condicional circulo cuad3,5 y 7
      strokeWeight(5);                                                          //ancho de linea
      stroke(0,150,0);                                                          //color linea
      line(20,460,620,20);                                                      //linea
      cuad1=1;                                                                  //deshabilita cuad1
      cuad2=1;                                                                  //deshabilita cuad2
      cuad3=1;                                                                  //deshabilita cuad3
      cuad4=1;                                                                  //deshabilita cuad4
      cuad5=1;                                                                  //deshabilita cuad5
      cuad6=1;                                                                  //deshabilita cuad6
      cuad7=1;                                                                  //deshabilita cuad7
      cuad8=1;                                                                  //deshabilita cuad8
      cuad9=1;                                                                  //deshabilita cuad9
      click=0;                                                                  //click valor inicial
    } 
    if(res1==2 && res2==2 && res3==2){                                          //condicional cruz cuad1,2 y 3
      strokeWeight(5);                                                          //ancho de linea
      stroke(150,0,0);                                                          //color linea
      line(20,75,620,75);                                                       //linea
      cuad1=1;                                                                  //deshabilita cuad1
      cuad2=1;                                                                  //deshabilita cuad2
      cuad3=1;                                                                  //deshabilita cuad3
      cuad4=1;                                                                  //deshabilita cuad4
      cuad5=1;                                                                  //deshabilita cuad5
      cuad6=1;                                                                  //deshabilita cuad6
      cuad7=1;                                                                  //deshabilita cuad7
      cuad8=1;                                                                  //deshabilita cuad8
      cuad9=1;                                                                  //deshabilita cuad9
      click=0;                                                                  //click valor inicial
    }
    if(res4==2 && res5==2 && res6==2){                                          //condicional cruz cuad4,5 y 6
      strokeWeight(5);                                                          //ancho de linea
      stroke(150,0,0);                                                          //color linea
      line(20,237,620,237);                                                     //linea
      cuad1=1;                                                                  //deshabilita cuad1
      cuad2=1;                                                                  //deshabilita cuad2
      cuad3=1;                                                                  //deshabilita cuad3
      cuad4=1;                                                                  //deshabilita cuad4
      cuad5=1;                                                                  //deshabilita cuad5
      cuad6=1;                                                                  //deshabilita cuad6
      cuad7=1;                                                                  //deshabilita cuad7
      cuad8=1;                                                                  //deshabilita cuad8
      cuad9=1;                                                                  //deshabilita cuad9
      click=0;                                                                  //click valor inicial
    }
    if(res7==2 && res8==2 && res9==2){                                          //condicional cruz cuad7,8 y 9
      strokeWeight(5);                                                          //ancho de linea
      stroke(150,0,0);                                                          //color linea
      line(20,400,620,400);                                                     //linea
      cuad1=1;                                                                  //deshabilita cuad1
      cuad2=1;                                                                  //deshabilita cuad2
      cuad3=1;                                                                  //deshabilita cuad3
      cuad4=1;                                                                  //deshabilita cuad4
      cuad5=1;                                                                  //deshabilita cuad5
      cuad6=1;                                                                  //deshabilita cuad6
      cuad7=1;                                                                  //deshabilita cuad7
      cuad8=1;                                                                  //deshabilita cuad8
      cuad9=1;                                                                  //deshabilita cuad9
      click=0;                                                                  //click valor inicial
    }
    if(res1==2 && res4==2 && res7==2){                                          //condicional cruz cuad1,4 y 7
      strokeWeight(5);                                                          //ancho de linea
      stroke(150,0,0);                                                          //color linea
      line(106,20,106,460);                                                     //linea
      cuad1=1;                                                                  //deshabilita cuad1
      cuad2=1;                                                                  //deshabilita cuad2
      cuad3=1;                                                                  //deshabilita cuad3
      cuad4=1;                                                                  //deshabilita cuad4
      cuad5=1;                                                                  //deshabilita cuad5
      cuad6=1;                                                                  //deshabilita cuad6
      cuad7=1;                                                                  //deshabilita cuad7
      cuad8=1;                                                                  //deshabilita cuad8
      cuad9=1;                                                                  //deshabilita cuad9
      click=0;                                                                  //click valor inicial
    }
    if(res2==2 && res5==2 && res8==2){                                          //condicional cruz cuad2,5 y 8
      strokeWeight(5);                                                          //ancho de linea
      stroke(150,0,0);                                                          //color linea
      line(320,20,320,460);                                                     //linea
      cuad1=1;                                                                  //deshabilita cuad1
      cuad2=1;                                                                  //deshabilita cuad2
      cuad3=1;                                                                  //deshabilita cuad3
      cuad4=1;                                                                  //deshabilita cuad4
      cuad5=1;                                                                  //deshabilita cuad5
      cuad6=1;                                                                  //deshabilita cuad6
      cuad7=1;                                                                  //deshabilita cuad7
      cuad8=1;                                                                  //deshabilita cuad8
      cuad9=1;                                                                  //deshabilita cuad9
      click=0;                                                                  //click valor inicial 
    }
    if(res3==2 && res6==2 && res9==2){                                          //condicional cruz cuad3,6 y 9
      strokeWeight(5);                                                          //ancho de linea
      stroke(150,0,0);                                                          //color linea
      line(532,20,532,460);                                                     //linea
      cuad1=1;                                                                  //deshabilita cuad1
      cuad2=1;                                                                  //deshabilita cuad2
      cuad3=1;                                                                  //deshabilita cuad3
      cuad4=1;                                                                  //deshabilita cuad4
      cuad5=1;                                                                  //deshabilita cuad5
      cuad6=1;                                                                  //deshabilita cuad6
      cuad7=1;                                                                  //deshabilita cuad7
      cuad8=1;                                                                  //deshabilita cuad8
      cuad9=1;                                                                  //deshabilita cuad9
      click=0;                                                                  //click valor inicial 
    }
    if(res1==2 && res5==2 && res9==2){                                          //condicional cruz cuad1,5 y 9
      strokeWeight(5);                                                          //ancho de linea
      stroke(150,0,0);                                                          //color linea
      line(20,20,620,460);                                                      //linea
      cuad1=1;                                                                  //deshabilita cuad1
      cuad2=1;                                                                  //deshabilita cuad2
      cuad3=1;                                                                  //deshabilita cuad3
      cuad4=1;                                                                  //deshabilita cuad4
      cuad5=1;                                                                  //deshabilita cuad5
      cuad6=1;                                                                  //deshabilita cuad6
      cuad7=1;                                                                  //deshabilita cuad7
      cuad8=1;                                                                  //deshabilita cuad8
      cuad9=1;                                                                  //deshabilita cuad9
      click=0;                                                                  //click valor inicial
    }
    if(res3==2 && res5==2 && res7==2){                                          //condicional cruz cuad1,5 y 9
      strokeWeight(5);                                                          //ancho de linea
      stroke(150,0,0);                                                          //color linea
      line(20,460,620,20);                                                      //linea
      cuad1=1;                                                                  //deshabilita cuad1
      cuad2=1;                                                                  //deshabilita cuad2
      cuad3=1;                                                                  //deshabilita cuad3
      cuad4=1;                                                                  //deshabilita cuad4
      cuad5=1;                                                                  //deshabilita cuad5
      cuad6=1;                                                                  //deshabilita cuad6
      cuad7=1;                                                                  //deshabilita cuad7
      cuad8=1;                                                                  //deshabilita cuad8
      cuad9=1;                                                                  //deshabilita cuad9
      click=0;                                                                  //click valor inicial
    }    
    if (mouseX<210 && mouseY<157){                                              //condicional posicion cuad1
      if (cuad1==0){                                                            //condicional primer click cuad1
        if (click==0){                                                          //condicional click impar
          click=click+1;                                                        //suma click
          stroke(0,150,0);                                                      //linea verde
          noFill();                                                             //sin relleno
          ellipse (105,78,100,100);                                             //circulo
          cuad1=cuad1+1;                                                        //deshabilita cuad1
          res1=res1+1;                                                          //indica circulo cuad1
        }
        else
       if (cuad1==0){                                                           //condicional primer click cuad1
        click=click-1;                                                          //resta click
        stroke(150,0,0);                                                        //linea roja
        strokeWeight(5);                                                        //ancho de linea
        line(55,28,155,128);                                                    //linea cruz
        line(55,128,155,28);                                                    //linea cruz
        cuad1=cuad1+1;                                                          //deshabilita cuad1
        res1=res1+2;                                                            //indica cruz cuad1
      }
     }
    }
    if(mouseX>216 && mouseX<423 && mouseY<157){                                 //condicional posicion cuad2
      if(cuad2==0){                                                             //condicional primer click cuad2
        if(click==0){                                                           //condicional click impar
          click=click+1;                                                        //suma click
          stroke(0,150,0);                                                      //linea verde
          noFill();                                                             //sin relleno
          ellipse(318,78,100,100);                                              //circulo
          cuad2=cuad2+1;                                                        //deshabilita cuad2
          res2=res2+1;                                                          //indica circulo cuad2
        }
        else
        if(cuad2==0){                                                           //condicional primer click cuad2
          click=click-1;                                                        //resta click
          stroke(150,0,0);                                                      //linea roja
          strokeWeight(5);                                                      //ancho de linea
          line(268,28,368,128);                                                 //linea cruz
          line(268,128,368,28);                                                 //linea cruz
          cuad2=cuad2+1;                                                        //deshabilita cuad2
          res2=res2+2;                                                          //indica cruz cuad2
        }
      }
    }
    if(mouseX>469 && mouseY<157){                                               //condicional posicion cuad3
      if(cuad3==0){                                                             //condicional primer click cuad3
        if(click==0){                                                           //condicional click impar
          click=click+1;                                                        //suma click
          stroke(0,150,0);                                                      //linea verde
          noFill();                                                             //sin relleno
          ellipse(531,78,100,100);                                              //circulo
          cuad3=cuad3+1;                                                        //deshabilita cuad3
          res3=res3+1;                                                          //indica circulo cuad3
        }
        else
        if(cuad3==0){                                                           //condicional primer click cuad3
          click=click-1;                                                        //resta click
          stroke(150,0,0);                                                      //linea roja
          strokeWeight(5);                                                      //ancho de linea
          line(481,28,581,128);                                                 //linea cruz
          line(481,128,581,28);                                                 //linea cruz
          cuad3=cuad3+1;                                                        //deshabilita cuad3
          res3=res3+2;                                                          //indica cruz cuad3
        }
      }
    }
    if(mouseX<210 && mouseY>163 && mouseY<317){                                 //condicional posicion cuad4
      if(cuad4==0){                                                             //condicional primer click cuad4
        if(click==0){                                                           //condicional click impar
          click=click+1;                                                        //suma click
          stroke(0,150,0);                                                      //linea verde
          noFill();                                                             //sin relleno
          ellipse(105,240,100,100);                                             //circulo
          cuad4=cuad4+1;                                                        //deshabilita cuad4
          res4=res4+1;                                                          //indica ciruclo cuad4
        }
        else
        if(cuad4==0){                                                           //condicional primer click cuad4
          click=click-1;                                                        //resta click
          stroke(150,0,0);                                                      //linea roja    
          strokeWeight(5);                                                      //ancho de linea
          line(55,188,155,288);                                                 //linea cruz
          line(55,288,155,188);                                                 //linea cruz
          cuad4=cuad4+1;                                                        //deshabilita cuad4
          res4=res4+2;                                                          //indica cruz cuad4
        }
      }
    }
    if(mouseX>216 && mouseX<420 && mouseY>163 && mouseY<317){                   //condicional posicion cuad5
      if(cuad5==0){                                                             //condicional primer click cuad5
        if(click==0){                                                           //condicional click impar
          click=click+1;                                                        //suma click
          stroke(0,150,0);                                                      //linea verde
          noFill();                                                             //sin relleno
          ellipse(321,240,100,100);                                             //circulo
          cuad5=cuad5+1;                                                        //deshabilita cuad5
          res5=res5+1;                                                          //indica circulo cuad5
        }
        else
        if(cuad5==0){                                                           //condicional primer click cuad5
          click=click-1;                                                        //resta click
          stroke(150,0,0);                                                      //linea roja    
          strokeWeight(5);                                                      //ancho de linea
          line(268,188,368,288);                                                //linea cruz
          line(268,288,368,188);                                                //linea cruz
          cuad5=cuad5+1;                                                        //deshabilita cuad5
          res5=res5+2;                                                          //indica cruz cuad5
        }
      }
    }
    if(mouseX>429 && mouseY>163 && mouseY<317){                                 //condicional posicion cuad6
      if(cuad6==0){                                                             //condicional primer click cuad6
        if(click==0){                                                           //condicional click impar
          click=click+1;                                                        //suma click
          stroke(0,150,0);                                                      //linea verde
          noFill();                                                             //sin relleno
          ellipse(531,240,100,100);                                             //circulo
          cuad6=cuad6+1;                                                        //deshabilita cuad6
          res6=res6+1;                                                          //indica circulo cuad6
        }
        else
        if(cuad6==0){                                                           //condicional primer click cuad6 
          click=click-1;                                                        //resta click
          stroke(150,0,0);                                                      //linea roja
          strokeWeight(5);                                                      //ancho de linea
          line(481,188,581,288);                                                //linea cruz
          line(481,288,581,188);                                                //linea cruz
          cuad6=cuad6+1;                                                        //deshabilita cuad6
          res6=res6+2;                                                          //indica cruz cuad6
        }
      }
    }
    if(mouseX<210 && mouseY>323){                                               //condicional posicion cuad7
      if(cuad7==0){                                                             //condicional primer click cuad7
        if(click==0){                                                           //condicional click impar
          click=click+1;                                                        //suma click
          stroke(0,150,0);                                                      //linea verde
          noFill();                                                             //sin relleno
          ellipse(105,400,100,100);                                             //circulo
          cuad7=cuad7+1;                                                        //deshabilita cuad7
          res7=res7+1;                                                          //indica circulo cuad7
        }
        else
        if(cuad7==0){                                                           //condicional primer click cuad7
          click=click-1;                                                        //resta click
          stroke(150,0,0);                                                      //linea roja
          strokeWeight(5);                                                      //ancho de linea
          line(55,348,155,448);                                                 //linea cruz
          line(55,448,155,348);                                                 //linea cruz
          cuad7=cuad7+1;                                                        //deshabilita cuad7
          res7=res7+2;                                                          //indica cruz cuad7
        }
      }
    }
    if(mouseX>216 && mouseX<423 && mouseY>323){                                 //condicional posicion cuad8
      if(cuad8==0){                                                             //condicional primer click cuad8
        if(click==0){                                                           //condicional click impar
          click=click+1;                                                        //suma click
          stroke(0,150,0);                                                      //linea verde
          noFill();                                                             //sin relleno
          ellipse(321,400,100,100);                                             //circulo
          cuad8=cuad8+1;                                                        //deshabilita cuad8
          res8=res8+1;                                                          //indica circulo cuad8
        }
        else
        if(cuad8==0){                                                           //condicional primer click cuad8
          click=click-1;                                                        //resta click
          stroke(150,0,0);                                                      //linea roja
          strokeWeight(5);                                                      //ancho de linea
          line(268,348,368,448);                                                //linea cruz
          line(268,448,368,348);                                                //linea cruz
          cuad8=cuad8+1;                                                        //deshabilita cuad8
          res8=res8+2;                                                          //indica cruz cuad8
        }
      }
    }
    if(mouseX>429 && mouseY>323 && mouseY<480){                                 //condicional posicion cuad9
      if(cuad9==0){                                                             //primer click cuad9
        if(click==0){                                                           //condicional click impar
          click=click+1;                                                        //suma click
          stroke(0,150,0);                                                      //linea verde
          noFill();                                                             //sin relleno
          ellipse(534,400,100,100);                                             //circulo
          cuad9=cuad9+1;                                                        //deshabilita caud9
          res9=res9+1;                                                          //indica circulo cuad9
        }
        else
        if(cuad9==0){                                                           //condicional primer click cuad9
          click=click-1;                                                        //resta click
          stroke(150,0,0);                                                      //linea roja
          strokeWeight(5);                                                      //ancho de linea
          line(481,348,581,448);                                                //linea cruz
          line(481,448,581,348);                                                //linea cruz
          cuad9=cuad9+1;                                                        //deshabilita cuad9
          res9=res9+2;                                                          //indica cruz cuad9
        }
      }
    }
  }
