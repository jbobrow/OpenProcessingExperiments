
class myBool{

int[] rules;  
float state;
myBool() {
    rules = new int [32];
}
//----------------------------------------------------------------------------
float randomize(){
    float pFill=int(random(11));
    if(pFill<5)
      pFill=0;
    else
      pFill=1;
    return pFill; 
}
//----------------------------------------------------------------------------
void initialize(){
  if(initial){
    for(int i=0;i<rules.length;i++)//randomize rules
      rules[i]=((int)(random(2)));  
    for(int x=0;x<numNode;x++){
      for(int y=0;y<numNode;y++){    
            p1 = new PVector(interval*(1+2*x),interval*(1+2*y),0);
            p1.z=randomize();
            pNodeList.add(p1);
        }
      }
  }
  initial=false;
}
//----------------------------------------------------------------------------
void changeNodeState(){
  int count=0;
  for(int x=0;x<numNode;x++){
    for(int y=0;y<numNode;y++){    
        p2 =(PVector) pNodeList.get(count);
        if (p2.z==1)
          fill(255);
        else
          fill(0);
        noStroke();    
        ellipse(p2.x,p2.y,5,5);
        count++;  
    }
  }
}
//----------------------------------------------------------------------------
void addInputs(){
  if(reset){
    noFill();
    for(int i=0; i<pNodeList.size();i++){
      p3 =(PVector) pNodeList.get(i);
      //ellipse(p3.x,p3.y,9,9);
       if(k!=0){
         input[i][k-1]=int(random(pNodeList.size()));
         p4 =(PVector) pNodeList.get(input[i][k-1]);
         stroke(0);
         if (p3==p4)
           ellipse(p3.x+11,p4.y+11,30,30);
         else
           line(p3.x,p3.y,p4.x,p4.y);
       }
    } 
  }
  reset=false;
}
//----------------------------------------------------------------------------
void stateUpdate(){
   for(int i=0; i<pNodeList.size();i++){
     PVector p9 =(PVector) pNodeList.get(i);  
     p9.z=rules(input,i);
  }
}
//----------------------------------------------------------------------------
float rules(int[][]in,int current){
  float a,b,c,d,e;
    if (k==0){
    pc=(PVector) pNodeList.get(current);
    state = pc.z;
    }
    else if(k==1){
        pa=(PVector) pNodeList.get(in[current][1]);
        pc=(PVector) pNodeList.get(current);
        a = pa.z;
        c = pc.z;
        if (a == 1 && c == 1) state=rules[0];
        else if (a == 1 && c == 0) state=rules[1];
        else if (a == 0 && c == 1) state=rules[2];
        else state=rules[3];
    }
    else if(k==2){  
        pa=(PVector) pNodeList.get(in[current][1]);
        pb=(PVector) pNodeList.get(in[current][2]);
        pc=(PVector) pNodeList.get(current);
        a = pa.z;
        b = pb.z;
        c = pc.z;
        if (a == 1 && b == 1 && c == 1) state=rules[0];
        else if (a == 1 && b == 1 && c == 0) state=rules[1];
        else if (a == 1 && b == 0 && c == 1) state=rules[2];
        else if (a == 1 && b == 0 && c == 0) state=rules[3];
        else if (a == 0 && b == 1 && c == 1) state=rules[4];
        else if (a == 0 && b == 1 && c == 0) state=rules[5];
        else if (a == 0 && b == 0 && c == 1) state=rules[6];
        else state=rules[7];
    }
    else if(k==3){
        pa=(PVector) pNodeList.get(in[current][1]);
        pb=(PVector) pNodeList.get(in[current][2]);
        pc=(PVector) pNodeList.get(in[current][3]);
        pd=(PVector) pNodeList.get(current);
        a = pa.z;
        b = pb.z;
        c = pc.z;
        d = pd.z;
        if (a == 1 && b == 1 && c == 1 && d == 1) state=rules[0];
        else if (a == 1 && b == 1 && c == 1 && d == 0) state=rules[1];
        else if (a == 1 && b == 1 && c == 0 && d == 1) state=rules[2];
        else if (a == 1 && b == 1 && c == 0 && d == 0) state=rules[3];
        else if (a == 1 && b == 0 && c == 1 && d == 1) state=rules[4];
        else if (a == 1 && b == 0 && c == 1 && d == 0) state=rules[5];
        else if (a == 1 && b == 0 && c == 0 && d == 1) state=rules[6];
        else if (a == 1 && b == 0 && c == 0 && d == 0) state=rules[7];
        else if (a == 0 && b == 1 && c == 1 && d == 1) state=rules[8];
        else if (a == 0 && b == 1 && c == 1 && d == 0) state=rules[9];
        else if (a == 0 && b == 1 && c == 0 && d == 1) state=rules[10];
        else if (a == 0 && b == 1 && c == 0 && d == 0) state=rules[11];
        else if (a == 0 && b == 0 && c == 1 && d == 1) state=rules[12];
        else if (a == 0 && b == 0 && c == 1 && d == 0) state=rules[13];
        else if (a == 0 && b == 0 && c == 0 && d == 1) state=rules[14];
        else if (a == 0 && b == 0 && c == 0 && d == 0) state=rules[15];    
    }
        else if(k==4){
        pa=(PVector) pNodeList.get(in[current][1]);
        pb=(PVector) pNodeList.get(in[current][2]);
        pc=(PVector) pNodeList.get(in[current][3]);
        pd=(PVector) pNodeList.get(in[current][4]);
        pe=(PVector) pNodeList.get(current);
        a = pa.z;
        b = pb.z;
        c = pc.z;
        d = pd.z;
        e = pe.z;
        if (a == 1 && b == 1 && c == 1 && d == 1 && e == 0) state=rules[0];
        else if (a == 1 && b == 1 && c == 1 && d == 1 && e == 1) state=rules[1];
        else if (a == 1 && b == 1 && c == 1 && d == 0 && e == 0) state=rules[2];
        else if (a == 1 && b == 1 && c == 1 && d == 0 && e == 1) state=rules[3];
        else if (a == 1 && b == 1 && c == 0 && d == 1 && e == 0) state=rules[4];
        else if (a == 1 && b == 1 && c == 0 && d == 1 && e == 1) state=rules[5];
        else if (a == 1 && b == 1 && c == 0 && d == 0 && e == 0) state=rules[6];
        else if (a == 1 && b == 1 && c == 0 && d == 0 && e == 1) state=rules[7];
        else if (a == 1 && b == 0 && c == 1 && d == 1 && e == 0) state=rules[8];
        else if (a == 1 && b == 0 && c == 1 && d == 1 && e == 1) state=rules[9];
        else if (a == 1 && b == 0 && c == 1 && d == 0 && e == 0) state=rules[10];
        else if (a == 1 && b == 0 && c == 1 && d == 0 && e == 1) state=rules[11];
        else if (a == 1 && b == 0 && c == 0 && d == 1 && e == 0) state=rules[12];
        else if (a == 1 && b == 0 && c == 0 && d == 1 && e == 1) state=rules[13];
        else if (a == 1 && b == 0 && c == 0 && d == 0 && e == 0) state=rules[14];
        else if (a == 1 && b == 0 && c == 0 && d == 0 && e == 1) state=rules[15];
        else if (a == 0 && b == 1 && c == 1 && d == 1 && e == 0) state=rules[16];
        else if (a == 0 && b == 1 && c == 1 && d == 1 && e == 1) state=rules[17];
        else if (a == 0 && b == 1 && c == 1 && d == 0 && e == 0) state=rules[18];
        else if (a == 0 && b == 1 && c == 1 && d == 0 && e == 1) state=rules[19];
        else if (a == 0 && b == 1 && c == 0 && d == 1 && e == 0) state=rules[20];
        else if (a == 0 && b == 1 && c == 0 && d == 1 && e == 1) state=rules[21];
        else if (a == 0 && b == 1 && c == 0 && d == 0 && e == 0) state=rules[22];
        else if (a == 0 && b == 1 && c == 0 && d == 0 && e == 1) state=rules[23];
        else if (a == 0 && b == 0 && c == 1 && d == 1 && e == 0) state=rules[24];
        else if (a == 0 && b == 0 && c == 1 && d == 1 && e == 1) state=rules[25];
        else if (a == 0 && b == 0 && c == 1 && d == 0 && e == 0) state=rules[26];
        else if (a == 0 && b == 0 && c == 1 && d == 0 && e == 1) state=rules[27];
        else if (a == 0 && b == 0 && c == 0 && d == 1 && e == 0) state=rules[28];
        else if (a == 0 && b == 0 && c == 0 && d == 1 && e == 1) state=rules[29];
        else if (a == 0 && b == 0 && c == 0 && d == 0 && e == 0) state=rules[30];  
        else if (a == 0 && b == 0 && c == 0 && d == 0 && e == 1) state=rules[31];
        }
    return state;
  }
}

