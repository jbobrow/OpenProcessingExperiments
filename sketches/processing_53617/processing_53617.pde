
background(255);
size(250,250);

//anti-alias
smooth();

for(int x=10;x<=120;x+=20){
//side 1
  line(x,125,125,(120-x));
//side 2
  line(x+130,125,125,x);
//side 3
  line(x,125,125,x+130);
//side 4
  line(x+130,125,125,(250-x));
  
  
}

                
                                
