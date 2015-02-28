
void rectA(x,y){
    line(x,y,x,y+20);
    line(x,y+20,x+50,y+20);
    line(x+50,y+20,x+50,y);
    line(x+50,y,x,y);
}

size(500,500);
rectA(100,100);
