
import rwmidi.*;//inportamos libreria Midi

boolean notaoff;// nota off

int Volumen=100,
    Px=10,
    nota,//para almacenar la nota
    chanel;//almacenar el CHANNEL
int [] estado = {255,255,255,255,255,255,255};// array para cambiar el color de los botones

MidiOutput output;//decraramo el objeto tipo MidiOuput

void setup(){
size(200,200);
 output = RWMidi.getOutputDevices()[0].createOutput();//selecionamos puerto midi de salidas 
}

void draw(){
background(#000000);//fondo negro
fill(255);//color para el texto
text("Processing Midi con RWMidi",10,20);
fill(255);//color para el texto
text("Volumen "+Volumen,46,185);
for(int i=0;i<7;i++){//ciclo for para pintar todos los botones
  noStroke();// sin bordes
  fill(estado[i]);//pintamos del color correspoendiente al boton que dibujamos
  rect(Px,100,20,20);//pintamos el cuadrado
  Px+=25;//corremos en X
}
Px=10;//reiniciamos

//las lineas a continuacion coresponden al scrollbar

stroke(255);
fill(0);
rect(45,150,100,20);// cuadro decorativo 
noStroke();
fill(128);
rect(46,155,Volumen,11);//representamos la posicion en x del srcrollbar

}
void mousePressed(){// si hacemos clic
println("mouseX: "+mouseX +" mouseY: "+mouseY);// donde hice clic?
if(mouseX<=29&&mouseX>=10&&mouseY>=100&&mouseY<=120){//fue en el boton 1
  if(estado[0]==255){//si color igual a 255 (blanco)
  estado[0]=50;      //cambiamos el color de cuadro-rectangulo como sea
  nota=0x18;}        //damos el valor a la nota
  else {             // si no
  estado[0]=255;     //lo ponemos blanco
  nota=0x18;         //asignamos valor a la nota 
  notaoff=true;}     // apaganos la nota 
}
if(mouseX<=55&&mouseX>=35&&mouseY>=100&&mouseY<=120){
  if(estado[1]==255){
    estado[1]=50;
    nota=0x1A;
  }   
  else{ 
  estado[1]=255;
  nota=0x1A;
  notaoff=true;
  }
}
if(mouseX<=80&&mouseX>=60&&mouseY>=100&&mouseY<=120){
  if(estado[2]==255){
    estado[2]=50;
    nota=0x1C;
  }
  else{ 
  estado[2]=255;
  nota=0x1C;
  notaoff=true;
  }  
}
if(mouseX<=105&&mouseX>=85&&mouseY>=100&&mouseY<=120){
  if(estado[3]==255){
    estado[3]=50;
    nota=0x1D;
  }
  else{ estado[3]=255;
  nota=0x1D;
  notaoff=true;
  }
}
if(mouseX<=130&&mouseX>=110&&mouseY>=100&&mouseY<=120){
  if(estado[4]==255){
    estado[4]=50;
    nota=0x1F;
  }
  else{
    estado[4]=255;
    nota=0x1F;
    notaoff=true;
    }
  }
if(mouseX<=155&&mouseX>=135&&mouseY>=100&&mouseY<=120){
  if(estado[5]==255){
    estado[5]=50;
    nota=0x21;
    }
  else{ 
     estado[5]=255;
     nota=0x21;
     notaoff=true;
    }
  }
if(mouseX<=180&&mouseX>=160&&mouseY>=100&&mouseY<=120){
  if(estado[6]==255){
    estado[6]=50;
    nota=0x23;
  }
  else{
    estado[6]=255;
    nota=0x23;
    notaoff=true;
    }  
  }
  
 if(notaoff==true&&nota!=0){//sí notaoff es verdadera y nota diferente de cero
   output.sendNoteOn(chanel, nota,0);// entonces enviamos el codigo para apagar la nota (volumen=0)
   notaoff=false;//restablesemos el flag notaoff
   nota=0;       // y la variable nota
   }   
 else if (nota!=0){//sí no pero la variable nota igual diferente de cero.
   output.sendNoteOn(chanel, nota, Volumen);//entonces enviamos la nota con el volumen que este ajustado
   nota=0;//
   } 
  
}
void mouseDragged(){//arrastramos el mouse
     if(mouseX<=145&&mouseX>=45&&mouseY>=150&&mouseY<=170){//fue en el area del scrollbar
    Volumen=mouseX-45;//si, asignamos el valos que tenga el en X el mouse.
    }
}

