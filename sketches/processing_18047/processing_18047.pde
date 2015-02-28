
size (250,250);
smooth();
background(198,149,255);

strokeWeight(12);
//black vertical lines
for(int y=35; y<=250; y+=60){
for(int x=35;x<=250;x+=60){
stroke(0,0,0,95);
line(x,0,x,250);
}
}

strokeWeight(6);
//black thinner vertical lines
for(int y=20; y<=250; y+=60){
for(int x=20; x<=250;x+=60){
stroke(0,0,0,20);
line(x,0,x,250);
}
}

strokeWeight(12);
//black horizontal lines
for(int y=35; y<=250; y+=60){
for(int x=35;x<=250;x+=60){
stroke(0,0,0,95);
line(0,y,250,y);
}
}

strokeWeight (6);
//white horizontal lines (top of horizontal black)
for(int y=25; y<=250; y+=60){
for(int x=25;x<=250;x+=60){
stroke(250,250,250,20);
line(0,y,250,y);
}
}

strokeWeight (6);
//black thinner horizontal lines
for(int y=20; y<=250; y+=60){
for(int x=20;x<=250;x+=60){
stroke(0,0,0,40);
line(0,y,250,y);
}
}

strokeWeight (.25);
//white single thin horizontal lines
for(int y=20; y<=250; y+=60){
for(int x=20;x<=250;x+=60){
stroke(250,250,250,200);
line(0,y,250,y);
}
}

strokeWeight (6);
//white horizontal lines (bottom of horizontal black)
for(int y=45; y<=250; y+=60){
for(int x=45;x<=250;x+=60){
stroke(250,250,250,20);
line(0,y,250,y);
}
}

strokeWeight (.25);
//white thin horizontal lines 
for(int y=32; y<=250; y+=60){
for(int x=32;x<=250;x+=60){
stroke(198,149,255,255);
line(0,y,250,y);
}
}

strokeWeight (.25);
//white thin horizontal lines 
for(int y=34; y<=250; y+=60){
for(int x=34;x<=250;x+=60){
stroke(198,149,255,255);
line(0,y,250,y);
}
}

strokeWeight (.25);
//white thin horizontal lines 
for(int y=36; y<=250; y+=60){
for(int x=36;x<=250;x+=60){
stroke(250,250,250,255);
line(0,y,250,y);
}
}

strokeWeight (.25);
//white thin horizontal lines 
for(int y=38; y<=250; y+=60){
for(int x=38;x<=250;x+=60){
stroke(250,250,250,255);
line(0,y,250,y);
}
}

strokeWeight(6);
//white veritical line (right of black line)
for(int y=45; y<=250; y+=60){
for(int x=45; x<=250; x+=60){
stroke(250,250,250,20);
line(x,0,x,250);
}
}

strokeWeight(6);
//white veritical line (right of black line)
for(int y=25; y<=250; y+=60){
for(int x=25; x<=250; x+=60){
stroke(250,250,250,20);
line(x,0,x,250);
}
}

strokeWeight(.25);
//white thin veritical line (right of black line)
for(int y=32; y<=250; y+=60){
for(int x=32; x<=250; x+=60){
stroke(198,149,255,255);
line(x,0,x,250);
}
}

strokeWeight(.25);
//white thin veritical line (right of black line)
for(int y=34; y<=250; y+=60){
for(int x=34; x<=250; x+=60){
stroke(198,149,255,255);
line(x,0,x,250);
}
}
strokeWeight(.25);
//white thin veritical line (left of black line)
for(int y=36; y<=250; y+=60){
for(int x=36; x<=250; x+=60){
stroke(250,250,250,250);
line(x,0,x,250);
}
}

strokeWeight(.25);
//white thin veritical line (right of black line)
for(int y=38; y<=250; y+=60){
for(int x=38; x<=250; x+=60){
stroke(250,250,250,250);
line(x,0,x,250);
}
}




