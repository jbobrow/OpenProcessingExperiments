
size(250,250);
//set background color to white
background(255);
//smooth the lines
smooth();
for(int x=10;x<120;x+=20){
    //top left section
    line(x,125,125,120-x);
    //top right section
    line(x+130,125,125,x);
    //bottom left section
    line(x,125,125,x+130);
    //bottom right section
    line(x+130,125,125,250-x);
}

                
                                
