

size(250,250);
background(#CEFDFF,2);
smooth();

noFill();
stroke(255);
strokeWeight(6);
bezier(0,0,10,180,140,80,250,250);
stroke(#F5FCFC);
bezier(0,0,20,180,140,70,250,250);
stroke(#E1F9FA);
bezier(0,0,30,180,140,60,250,250);
stroke(#CFF8FA);
bezier(0,0,40,180,140,50,250,250);
stroke(#BBF7FA);
bezier(0,0,50,180,140,40,250,250);
stroke(#A4F6FA);
bezier(0,0,60,180,140,30,250,250);
stroke(#86F5FA);
bezier(0,0,70,180,140,20,250,250);
stroke(#5CF1F7);
bezier(0,0,80,180,140,10,250,250);
stroke(#07EBF5);
bezier(0,0,90,180,140,0,250,250);
stroke(#04C8D1);
bezier(0,0,100,180,140,-10,250,250);
stroke(#04A8AF);
bezier(0,0,110,180,140,-20,250,250);
stroke(#038389);
bezier(0,0,120,180,140,-30,250,250);
stroke(#026D71);
bezier(0,0,130,180,140,-40,250,250);
stroke(#015155);
bezier(0,0,140,180,140,-50,250,250);
stroke(#013639);
bezier(0,0,150,180,140,-60,250,250);
stroke(#012021);
bezier(0,0,160,180,140,-70,250,250);
stroke(#000A0A);
bezier(0,0,170,180,140,-80,250,250);

for(int a=0; a<255; a+=6)
  for(int h=0; h<255; h+=6)
  {
    strokeWeight(4);
    stroke(255);
    point(h,a);
  }
                         
