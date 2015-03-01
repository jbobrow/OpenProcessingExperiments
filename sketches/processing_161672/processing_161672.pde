
int[][] Mlab={{0,1,1,0,1,0,1,0,1,1,0,0,0,0,1,1},
{0,1,0,0,0,0,1,0,1,1,1,0,0,0,1,1},
{1,1,0,1,1,2,0,0,0,0,2,2,2,0,1,0},
{0,0,0,1,1,2,1,1,1,1,2,0,2,0,1,0},
{1,1,0,0,0,1,1,1,1,1,1,1,2,0,1,0},
{1,1,0,1,1,2,1,1,1,1,1,0,1,0,1,0},
{0,0,0,1,1,2,2,3,2,0,1,0,2,0,1,0},
{1,1,0,1,1,0,1,1,1,0,1,1,2,0,0,0},
{1,1,0,0,0,0,1,1,1,0,1,0,1,0,0,0},
{1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0},
{1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1},
{1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1}};

//Declaracion de variables
int[][] Mp1=new int[12][16];
int[][] Mp2=new int[12][16];
int[][] Mb=new int[12][16];
int row=0,col=0,tipomov=0,direc=0,direcplayer2=0,ia=0,ja=0,gameover=0;
int rowa=0,cola=0,rowb=0,colb=0,cont=0,cont2=0,vida=0,vidan=0,mov=0;
PImage ladrillo,pasto,vidas,tanque11,tanque12,tanque13,tanque14,tanque21,tanque22,tanque23,tanque24,aguila;

//Fondo
void STAGE(){
  background(#F01B29);
  for(int i=0;i<=11;i++){
    for(int j=0;j<=15;j++){
      if (Mlab[i][j]==1){
        ladrillo.resize(50,50);
        image(ladrillo,50*j,50*i);
          
//       ddadsasdwdasdssasdasd fill(#0704DE);
//        rect(50*j,50*i,50,50);
//        
      }else if(Mlab[i][j]==2){
        pasto.resize(55,55);
        image(pasto,50*j,50*i);
      }else if(Mlab[i][j]==3){
        aguila.resize(55,55);
        image(aguila,50*j,50*i);      
      }else{fill(0); rect(50*j,50*i,50,50);}
    }    
  }
  if(gameover==1){fill(#FCF000);textSize(80);text("WINNER",200,300);}
  fill(0,0,255);
  textSize(32);
  text("V",820,25 + 250);
  text("I",825,50 + 250);
  text("D",820,75 + 250);
  text("A",822,100 + 250);
  text("S",822,125 + 250);
  vidas.resize(25,25);
  switch(vida){
    case 1:
    image(vidas,815,165);
    image(vidas,815,195);
    image(vidas,815,225);
     break;
     case 2:
     image(vidas,815,195);
    image(vidas,815,225);
    break;
    case 3:
    image(vidas,815,225);
    break;
    case 4:
    break;
  }
}

void gameover(){
  gameover=1;
}

//Mostrar jugadores
void show_players(){
  for(int i=0;i<=11;i++){
    for(int j=0;j<=15;j++){
      switch (Mp1[i][j]){
      case 1:
      switch (direc){
      case 1:
      tanque11.resize(50,50);
      image(tanque11,50*j,50*i);
      break;
      case 2:
      tanque12.resize(50,50);
      image(tanque12,50*j,50*i);
      break;
      case 0:
      case 3:
      tanque13.resize(50,50);
      image(tanque13,50*j,50*i);
      break;
      case 4:
      tanque14.resize(50,50);
      image(tanque14,50*j,50*i);
      break;
      
      }
        break;
       case 2:
        fill(0);
        ellipse(50*j+25,50*i+25,20,20);
        break;
      }
      switch (Mp2[i][j]){
      case 2:
      switch (direcplayer2){
      case 1:
      tanque21.resize(50,50);
      image(tanque21,50*j,50*i);
      break;
      case 2:
      tanque22.resize(50,50);
      image(tanque22,50*j,50*i);
      break;
      case 0:
      case 3:
      tanque23.resize(50,50);
      image(tanque23,50*j,50*i);
      break;
      case 4:
      tanque24.resize(50,50);
      image(tanque24,50*j,50*i);
      break;
      
      }
        break;
       case 1:
        fill(0);
        ellipse(50*j+25,50*i+25,20,20);
        break;
      }
    }
   }   
  }

//solo muestra las balas
void show_balas(){
  for(int i=0;i<=11;i++){
    for(int j=0;j<=15;j++){
      if (Mb[i][j] != 0){
        fill(255);
        ellipse(50*j+25,50*i+25,10,10);
      }
    }    
  }
}

//Movimiento jugador 1
int move_player1(int direc,int Mr,int Mc){
  int estado=0;
  for(int i=0;i<=11;i++){
    for(int j=0;j<=15;j++){
      if(Mp1[i][j]==1){
        
  if (Mlab[Mr][Mc]==0){
    if(Mp2[Mr][Mc]==0){
      Mp1[Mr][Mc]=1;
      estado=0;
      switch (direc){
         case 0:
          row=0;
          col=0;
          Mp1[Mr][Mc]=0;
          Mp1[0][0]=1;
          break;
          
          case 1:
          if(Mc != 15){
          Mp1[Mr][Mc + 1]=0;
          }
          break;
          case 2:
          if(Mc != 11){
          Mp1[Mr + 1][Mc]=0;
          }
          break;
          case 3:
          if(Mc != 0){
          Mp1[Mr][Mc - 1]=0;
          }
          break;
          case 4:
          if(Mr != 0){
          Mp1[Mr - 1][Mc]=0; 
          }
          break;
          
        }
    }else{estado=1;}
  }else{
    estado=1;
}
  
} } }
return estado;
}
//Inicio del juagdor 1
void start_player1(){
 
 Mp1[0][0]=1;
if(vida == 4){vida=0; gameover();}else{vida=vida + 1;} 
}


//Inicio del jugador 2
void start_player2(){
direcplayer2=int(random(1,5));
Mp2[3][11]=2;
}



//Movimiento jug. 2
void move_player2(int direcplayer2){
    for(int i=0;i<=11;i++){
      for(int j=0;j<=15;j++){
        if(Mp2[i][j]==2){
        switch (direcplayer2){
         case 0:
        
          break;
          
          case 1:
          if(j != 0){
            if(Mlab[i][j - 1] != 0){
                 
                }else{
                  if((Mp1[i][j - 1]==0)){
                    Mp2[i][j - 1]=2;
                    Mp2[i][j]=0;
                   }} 
          }
          break;
          case 2:
          if(i != 0){
            if(Mlab[i - 1][j] != 0){
                 
                }else{
                  if((Mp1[i - 1][j]==0)){
                    Mp2[i - 1][j]=2;
                    Mp2[i][j]=0;
                   }} 
          }
          break;
          case 3:
          if(j < 15){
            if((i==ia)&&(j==ja)){
              ia=-1; ja=-1;
            }else{
            if(Mlab[i][j + 1] != 0){
                 
                }else{
                  if((Mp1[i][j + 1]==0)){
                    Mp2[i][j + 1]=2;
                    Mp2[i][j]=0;
                    ia=i; ja=j+1;
                   }} 
          }}
          break;
          case 4:
          if(i < 11){
            if((i==ia)&&(j==ja)){
              ia=-1; ja=-1;
            }else{
            if(Mlab[i + 1][j] != 0){
                 
                }else{
                  if((Mp1[i + 1][j]==0)){
                    Mp2[i + 1][j]=2;
                    Mp2[i][j]=0;
                    ia=i+1; ja=j;
                   }}
          }
          } 
          break;
        }
      }    
    }
  }
}

//Movimiento de las balas
void move_balas(){
  
    for(int i=0;i<=11;i++){
      for(int j=0;j<=15;j++){
        switch (Mb[i][j]){
         case 0:
          //Mp1[][]=0;
          break;
          
          case 1:
          if(j != 0){
            if(Mlab[i][j - 1]==1){
                 Mlab[i][j - 1]=0;
                 Mb[i][j]=0;
                }else{
                  if((Mp1[i][j - 1]==0)&&(Mp2[i][j - 1]==0)){
                   if(Mb[i][j - 1] != 0){
                    Mb[i][j - 1]=0;
                    Mb[i][j]=0;
                   }else{Mb[i][j - 1]=1; Mb[i][j]=0;}
                  }else{Mb[i][j]=0;switch (Mp1[i][j - 1] + Mp2[i][j - 1]){
                  case 1:
                  Mp1[i][j - 1]=0;
                  direc=0;
                  start_player1();
                  break;
                  case 2:
                  Mp2[i][j - 1]=0;
                  start_player2();
                  } }
                 }
                }else{Mb[i][j]=0;}
          break;
          
          case 2:
          if(i != 0){
            
            if(Mlab[i - 1][j]==1){
                Mlab[i - 1][j]=0;
                Mb[i][j]=0;
                  }else{
                    if((Mp1[i - 1][j]==0)&&(Mp2[i - 1][j]==0)){
                    if(Mb[i - 1][j]!=0){
                      Mb[i - 1][j]=0;
                      Mb[i][j]=0;}else{Mb[i - 1][j]=2; Mb[i][j]=0;}
                    }else{Mb[i][j]=0;switch (Mp1[i - 1][j] + Mp2[i - 1][j]){
                  case 1:
                  Mp1[i - 1][j]=0;
                  direc=0;
                  start_player1();
                  break;
                  case 2:
                  Mp2[i - 1][j]=0;
                start_player2();  
                  } }
                       }
                  }else{Mb[i][j]=0;}
          break;
          
          case 3:
          if(j < 15){
            if((i==ia)&&(j==ja)){
              ia=-1; ja=-1;
            }else{
            if(Mlab[i][j + 1]==1){
            Mlab[i][j + 1]=0;
            Mb[i][j]=0;
              }else{
               if((Mp1[i][j + 1]==0)&&(Mp2[i][j + 1]==0)){
                if(Mb[i][j + 1]!=0){
                   Mb[i][j + 1]=0;
                   Mb[i][j]=0;}else{Mb[i][j + 1]=3; Mb[i][j]=0; ia=i; ja= j + 1;}
                    }else{Mb[i][j]=0;switch (Mp1[i][j + 1] + Mp2[i][j + 1]){
                  case 1:
                  Mp1[i][j + 1]=0;
                  direc=0;
                  start_player1();
                  break;
                  case 2:
                  Mp2[i][j + 1]=0;
                  start_player2();
                  } }
                  }              
              }
            }else{Mb[i][j]=0;}
          break;
          
          case 4:
            if(i < 11){
              if((i==ia)&&(j==ja)){
              ia=-1; ja=-1;
            }else{
              if(Mlab[i + 1][j]==1){
                  Mlab[i + 1][j]=0;
                  Mb[i][j]=0;
                      }else{
              if((Mp1[i + 1][j]==0)&&(Mp2[i + 1][j]==0)){        
                if(Mb[i + 1][j]!=0){
                   Mb[i][j]=0;
                   Mb[i][j]=0;}else{Mb[i + 1][j]=4; Mb[i][j]=0; ia=i + 1; ja= j;}
                 }else{Mb[i][j]=0;switch (Mp1[i + 1][j] + Mp2[i + 1][j]){
                  case 1:
                  Mp1[i + 1][j]=0;
                  direc=0;
                  start_player1();
                  break;
                  case 2:
                  Mp2[i + 1][j]=0;
                  start_player2();
                  } }
                }
               }         
              }else{Mb[i][j]=0;}
            break;
            
        }
      }    
    }
    for(int i=0;i<=11;i++){
      for(int j=0;j<=15;j++){
        switch (Mlab[i][j]){
        case 3:
        if(Mb[i][j] != 0){
         gameover();
        }
        break;
        }
      }
 }
}
//Disparar
void disparar(int direc1,int row1,int col1){
  switch (direc1){
    case 0:
    
    break;
    case 1:
    if(col1 != 0){
     if(Mlab[row1][col1 - 1]==1){
       Mb[row1][col1 - 1]=0;
       Mlab[row1][col1 - 1]=0;
     }else{
       Mb[row1][col1 - 1]=1;
    }
    }
    break;
    case 2:
    if(row1 != 0){
      if(Mlab[row1 - 1][col1]==1){
        Mlab[row1 - 1][col1]=0;
        Mb[row1 - 1][col1]=0;     
    }else{
      Mb[row1 - 1][col1]=2;
    }
    }
    break;
    case 3:
    if(col1 < 15){
      if(Mlab[row1][col1 + 1]==1){
        Mlab[row1][col1 + 1]=0;
        Mb[row1][col1 + 1]=0;
      }else{ 
        Mb[row1][col1 + 1]=3;     
    }
    }
    break;
    case 4:
    if(row1 < 11){
      if(Mlab[row1 + 1][col1]==1){
        Mb[row1 + 1][col1]=0;
        Mlab[row1 + 1][col1]=0;
        }else{
        Mb[row1 + 1][col1]=4;}     
        }
      break;
    
  }
      for(int i=0;i<=11;i++){
      for(int j=0;j<=15;j++){
        switch (Mp1[i][j] + Mp2[i][j]){
                  case 0:
                  break;
                  case 1:
                  if(Mb[i][j]!=0){
                    Mb[i][j]=0;
                    Mp1[i][j]=0;
                  }
                  break;
                  case 2:
                  if(Mb[i][j]!=0){
                    Mb[i][j]=0;
                    Mp2[i][j]=0;
                    start_player2();
                  }
                  }        
       }
      }
 }
 
 import processing.serial.*;
import cc.arduino.*;

Arduino arduino;
int sensor1=0;
int pin1;
int sensor2=1;
int pin2;

void setup(){
  background(255);
  size(850,600);
  ladrillo=loadImage("Ladrillo.png");
  pasto=loadImage("pasto.png");
  aguila=loadImage("Aguila.png");
  vidas=loadImage("vidas.png");
  tanque11=loadImage("tanque11.png");
  tanque12=loadImage("tanque12.png");
  tanque13=loadImage("tanque13.png");
  tanque14=loadImage("tanque14.png");
  
  tanque21=loadImage("player21.png");
  tanque22=loadImage("player22.png");
  tanque23=loadImage("player23.png");
  tanque24=loadImage("player24.png");
  start_player1();
  start_player2();
   arduino = new Arduino(this, Arduino.list()[0], 57600); //sets up arduino
   arduino.pinMode(sensor1, Arduino.INPUT);
   arduino.pinMode(sensor2, Arduino.INPUT);//setup pins to be input (A0 =0?)
  frameRate(6);
}

void draw(){
   background(255);
  STAGE();
  print("Row -> ");
  println(row);
  print("Col -> ");
  println(col);  
     tipomov=move_player1(direc,row,col);
      if (tipomov==1){
        row=rowa;
        col=cola;}
  move_player2(direcplayer2);
  if(cont==6){
    direcplayer2=int(random(1,5));
    cont=0;
  }else{cont=cont + 1;
  }
  
  if(cont2==3){
      for(int i=0;i<=11;i++){
      for(int j=0;j<=15;j++){
        if (Mp2[i][j]==2){
          rowb=i; colb=j;
          }
      }
    }
    disparar(direcplayer2,rowb,colb);
    cont2=0;
  }else{cont2 = cont2 + 1;}
  show_players();
  show_balas();
  move_balas();
  rowa=row;
  cola=col;
  print("Rowa -> ");
  println(rowa);
  print("Cola -> ");
  println(cola);
  mov=0;
  pin1=arduino.analogRead(sensor1);
  pin2=arduino.analogRead(sensor2);
if(pin1>574){
  mov=2;
  }else if(pin1<100){mov=4;
  }
if(pin2>574){
  mov=1;
  }else if(pin2<100){mov=3;
  }
  switch (mov){
        case 'w':
          if(row>0){
            row--;  
          }
          direc=2;
          break;
        case 's':
          if(row<11){
            row++; 
          }
          direc=4;
          break;
        case 'd':
          if(col<15){
            col++;  
          }
          direc=3;
          break;
        case 'a':
          if(col>0){
            col--;
          }
          direc=1;
          break;
        case 32:
        disparar(direc,row,col);
        break;
      
    }

  if(keyPressed){
      switch (key){
        case 'w':
          if(row>0){
            row--;  
          }
          direc=2;
          break;
        case 's':
          if(row<11){
            row++; 
          }
          direc=4;
          break;
        case 'd':
          if(col<15){
            col++;  
          }
          direc=3;
          break;
        case 'a':
          if(col>0){
            col--;
          }
          direc=1;
          break;
        case 32:
        disparar(direc,row,col);
        break;
      
    }    
  }
}
 
//
//void mando_pc(){
//       if(col<9){
//       col++;
//          } 
//    tipomov=move_player1(row,col);
//  if (tipomov==0){
//  
//  }else{
//    col=cola;
//     if(row<9){
//       row++;
//         }
//     tipomov=move_player1(row,col);
//     if (tipomov==0){
//       
//     }else{
//      if(row>0){
//           row--;
//          }
//    tipomov=move_player1(row,col);
//     if (tipomov==0){
//       
//     }else{
//       row=rowa;
//         if(col>0){
//            col--;
//          }
//       }
//    }
// }
//   
//}
