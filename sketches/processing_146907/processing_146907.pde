
int posX=0;
int posY=0;
int tamanio=15;
int separacion=20;
int Mx=0;
int My=0;
boolean drag;

void setup(){
    size(400,400);
}

void mousePressed(){

drag=true;
}


void mouseReleased(){
Mx=mouseX-tamanio;
My=mouseY-tamanio;
posX=Mx;
posY=My;

drag=false;
}


void draw(){

    fill(0,50);
    rect(0,0,width,height);
    
    if (drag == false) { 
    while (posY<mouseY){    
           while(posX<mouseX){
            if (posX==Mx && posY == My){fill(255,0,0,int(random(50,100)));}
            else{fill(int(random(255)));}
            rect(posX,posY,tamanio,tamanio);
            posX=posX+separacion;
        }
        posX=Mx;
        posY=posY+separacion;
        }
    }else{
        fill(255,0,0,int(random(50,100)));
        rect(mouseX-tamanio,mouseY-tamanio,tamanio,tamanio);
        }
posY = My;
}
