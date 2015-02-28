
//////////////////////////Prime spiral:
boolean IsPrime(int number)
{
    if (number <= 1) return false;
    for (int i=2; i*i<=number; i++)
    {
        if (number % i == 0) return false;
    }
    return true;
}
ArrayList<Integer> marked=new ArrayList<Integer>();
int viewMode=2,Euler=0;
void test(int dim,int its)
{
    int r=1,inv=1,step=0,i=1;
    float[] V=new float[dim]; 
    while(i<its)
    {
        for(int x=0;x<dim;x++)
        {        
            for(int y=0;y<r;y++)
            {      
                if(walker==i || viewMode==5 || (viewMode==0 || viewMode==3 || viewMode==4) && !IsPrime(i) || (viewMode==1 || viewMode==2) && IsPrime(i))
                {
                    stroke(255,255,255);     
                    float zval=0,yval=0;
                    if(view_dimension>2 && calc_dimension>2)
                    {
                      zval=V[2];
                    }
                    if(calc_dimension>1)
                    {
                      yval=V[1]; 
                    }
                    float cnt=0;
                    if(viewMode==0 || viewMode==3 || viewMode==4)
                    {
                        for(int j=2; j<i;j++)
                        {
                            if(i%j==0)
                            {
                               cnt+=1; 
                            }
                        }
                        stroke(cnt*4,cnt*4,cnt*4);
                    }
                    if(viewMode==3)
                    {
                        strokeWeight((int)(cnt/10.0)); 
                    }
                    boolean euled=false;
                    if(Euler!=0)
                    {
                        for(int j=1;j<i;j++)
                        {
                            if(i==j*j-j+41)
                            {
                                euled=true;
                                stroke(255,0,0);
                            } 
                        }
                    }
                    for(int j=0;j<marked.size();j++)
                    {
                      if((Integer)marked.get(j)==i)
                      {
                        stroke(0,0,255);
                      } 
                    }
                    if(walker==i || Euler!=1 || euled)
                    {
                      if(walker==i)
                      {
                        stroke(0,255,0); 
                      }
                      point(V[0],yval,zval);
                    }
                }
                V[x]+=1*inv; i+=1;
              } 
        }
        r=r+1; inv=inv*(-1); step+=1;
    }
}
//////////////////////////GUI:
int walker=-1,walkerstep=1,button=1,view_dimension=3, calc_dimension=3, markn=108;
int c=2,v=12,w=2,d=31;
float its=50000,itsstep=1.2;
String[] buttons=new String[]{"use UP and DOWN, ENTER, + and -, zoom with w and s, m for walker mark","iterations "+Integer.toString((int)its),"iterationsstep "+Integer.toString((int)(itsstep*10)-10),"calc dimension "+Integer.toString(calc_dimension),"view dimension "+Integer.toString(view_dimension),"view modes",
"show n^2-n+41 (Euler)","rotate 90°","walkerstep "+Integer.toString(walkerstep),"walker "+Integer.toString(walker),"hide GUI","line walk offset "+Integer.toString(d),"line walk w'=w+v; v'=v+c; p'=w'+d","line walk mark "+Integer.toString(markn),"marked prime NaN%","prime viewer by Patrick Hammer"};
boolean HiddenGUI=false, linewalkinit=false, linewalkfirstinit=true;
void ButtonFunction()
{
  int i=1; Update=true;
  if(button==i && key=='+')
  {
     its=its*itsstep;
  }
  if(button==i  && key=='-')
  {
     its=its/itsstep;
  }i++;
  if(button==i && key=='+')
  {
     itsstep+=0.1; Update=false;
  }
  if(button==i  && key=='-')
  {
     itsstep=max(1.1,itsstep-0.1); Update=false;
  }i++;
  if(button==i && key=='+')
  {
     calc_dimension+=1;
  }
  if(button==i  && key=='-')
  {
     calc_dimension=max(1,calc_dimension-1);
  }i++;
  if(button==i && key=='+')
  {
     view_dimension=min(3,view_dimension+1);
  }
  if(button==i  && key=='-')
  {
     view_dimension=max(2,view_dimension-1);
  }i++;
  if(button==i)
  {
     viewMode=(viewMode+1)%6; 
     vi=viewMode%2+1;
     if(viewMode==4){vi=2;}
     strokeWeight(vi);
  }i++;
  if(button==i)
  {
     Euler=(Euler+1)%3;
  }i++;
  if(button==i)
  {
     vi=1; rotation=(rotation+1)%4;
  }i++;
  if(button==i && key=='+')
  {
     walkerstep+=1; Update=false;
  }
  if(button==i && key=='-')
  {
     walkerstep=max(1,walkerstep-1); Update=false;
  }i++;
  if(button==i && keyCode==ENTER)
  {
      walker=-1;
  }
  if(button==i && key=='+')
  {
      walker+=walkerstep;
  }
  if(button==i && key=='-')
  {
     walker-=walkerstep;
  }i++;
  if(button==i)
  {
     HiddenGUI=!HiddenGUI;
  }i++;
  if(button==i && key=='+')
  {
     d+=1; walker=w-d; Update=true;
  }
  if(button==i && key=='-')
  {
     d-=1; walker=w-d; Update=true;
  }
  i++;
  if(button==i && key=='+')
  {
    w+=v; v+=c;
    walker=w+d;
    Update=true;
  }
  if(button==i && key=='-')
  {
    v-=c; w-=v; 
    walker=w+d;
    Update=true;
  }
  i++;
  if(button==i && key=='+')
  {
    markn*=1.2;
  }
  if(button==i && key=='-')
  {
    markn/=1.2; 
  }
  if(button==i)
  {
   Mark();
  }
}
void Mark()
{
 linewalkinit=true; LineWalkInit();
 marked=new ArrayList<Integer>();
 for(int j=0;j<markn;j++)
 {
   w+=v; v+=c; walker=w+d;
   marked.add(walker);
 } 
}
void LineWalkInit()
{
 if(linewalkinit && calc_dimension==2)
  {
    c=8; v=8; w=1; walker=1;
    linewalkinit=false; Update=true;
  }
  if(linewalkinit && calc_dimension==3)
  {
   c=12; v=12; w=0; walker=2;
   linewalkinit=false; Update=true;
  } 
  if(linewalkinit && (calc_dimension>3 || calc_dimension<2)){ v=0; c=0; w=0; walker=-1; linewalkinit=false; Update=true; }
}
void keyPressed()
{
  LineWalkInit();
  if((keyCode==DOWN && linewalkfirstinit && button==buttons.length-5) || ((key=='+' || key=='-') && (button==3) && !linewalkfirstinit))
  {
    linewalkinit=true; linewalkfirstinit=false; Update=true;
  }
  if(keyCode==DOWN)
  {
    button=min(buttons.length-3,button+1); HiddenGUI=false;
  }
  if(keyCode==UP)
  {
    button=max(1,button-1); HiddenGUI=false; 
  }
  if(keyCode==ENTER || key=='+' || key=='-')
  {
    ButtonFunction();
  }
  if(key=='w')
  {
    fov_val=min(-0.79,fov_val+0.05); Update=true;
  }
  if(key=='s')
  {
    fov_val=max(-3.44,fov_val-0.05); Update=true;
  }
  if(key=='m')
  {
    boolean Breaked=false;
    for(int i=0;i<marked.size();i++)
    {
      if((Integer)marked.get(i)==walker)
      {
       marked.remove(i);
       Breaked=true; break;
      }
    }
    if(!Breaked){marked.add(walker);}
    Update=true;
  }
  buttons[buttons.length-8]="walkerstep "+Integer.toString(walkerstep);
  buttons[buttons.length-7]="walker "+Integer.toString(walker);
  buttons[1]="iterations "+Integer.toString((int)its);
  buttons[2]="iterationsstep "+Integer.toString((int)(itsstep*10)-10);
  buttons[3]="calc dimension "+Integer.toString(calc_dimension);
  buttons[4]="view dimension "+Integer.toString(view_dimension);
  float primes=0;
  for(int i=0;i<marked.size();i++)
  {
   if(IsPrime(marked.get(i)))
   {
    primes+=1;
   } 
  }
  float primepercent=primes/((float)marked.size());
  buttons[buttons.length-2]="marked prime "+Float.toString(primepercent*100)+"%";
  buttons[buttons.length-3]="line walk mark "+Integer.toString(markn);
  buttons[buttons.length-4]="line walk w'=w+v; v'=v+c; p'=w'+d";  
  buttons[buttons.length-5]="line walk offset "+Integer.toString(d);
}
void DrawButtons()
{
  if(!HiddenGUI)
  {
   for(int i=0;i<buttons.length;i++)
   {
     if( i==button ){ fill(255); }else{ fill(128); }
     text(buttons[i],10,(height/buttons.length)*i+height/buttons.length/2);
   }
  }
}
//////////////////////////Program:
void setup()
{
  size(800, 800, P3D); strokeWeight(vi); textMode(SCREEN); Mark();
}
float fov_val=-1.5, vi=1;
int rotation=0,lastmousex=0,lastmousey=0;
boolean init=false, Update=false;
void draw()
{
  pushMatrix();
  fill(0); translate(0,0,600); rect(0,0,width,height);
  popMatrix();
  pushMatrix();
  if(!init || Update || (!(view_dimension==2) && (mouseX!=lastmousex || mouseY!=lastmousey)))
  {
      init=true; Update=false;
      background(0); fill(255);
      float cameraY = height/2.0, fov = PI/4+fov_val, cameraZ = cameraY / tan(fov / 2.0), aspect = float(width)/float(height);
      perspective(fov, aspect, cameraZ/10.0, cameraZ*10.0);
      translate(width/2, height/2, 0);
      rotateZ(2*PI/4*rotation);
      if(!(view_dimension==2))
      {
          rotateX(PI/3 + mouseY/float(height) * PI*2); rotateY(PI/3 + mouseX/float(width) * PI*2);
      } 
      test(calc_dimension,(int)its);
  }
  lastmousex=mouseX; lastmousey=mouseY;
  popMatrix();
  DrawButtons();
}

