
//Bridget Riley's "Shadow Play"
//Copyright (c) Bridget Riley 1990 All Right Resereved.



int foot=32;
int xpos,ypos;
float dlg = foot * sqrt(2);
int cc;
int sc;
int pets;

void setup(){
  //size(1280,1024);
  size(315,600);
  colorMode(RGB,350);
  smooth();
  background(#FFE0E6);
}

void draw(){
  noLoop();
  translate(-dlg,-2*foot);
  for(int q=0;q<width/dlg+1;q++){
    for(int x=1;x<height*2/foot;x++){
      for(int i=0;i<dlg;i++){
        stroke(cc);
        line(i,-i,i,foot+i);
      }
      xpos+=1;
      translate(0,foot);
      sc = round(random(12));
      switch(sc){
        case 1: cc = #2A5FCF; break;
        case 2: cc = #35577A; break;
        case 3: cc = #72ABF0; break;
        case 4: cc = #FFE0E6; break;
        case 5: cc = #C991D8; break;
        case 6: cc = #A47EAD; break;
        case 7: cc = #FFA151; break;
        case 8: cc = #E96686; break;

        case 10: cc = #0094C2; break;
        case 11: cc = #71B369; break;
        case 12: cc = #FFE49D; break;
        case 9: cc = #35577A; break; 
   
  //    case 9: cc = #F36F94; break;     
      }
      pets = x;
    }
    translate(dlg,-height*2+foot+3);
  }
}
//blue #2A5FCF
//bblue #35577A 
//lblue #72ABF0 
//white #FFE0E6
//purple #C991D8
//dpurple #A47EAD
//orange #FFA151
//dred #E96686
//red #F36F94
//green #0094C2
//lgreen #71B369
//lyellow #FFE49D

