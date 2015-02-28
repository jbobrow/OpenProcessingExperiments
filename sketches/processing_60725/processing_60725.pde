
// SECRET ENCODER DECODER by TEDDYBOT
// Place a secret message in the file 1.txt
// Run this program to get your secret code.

int numstacks=24;
stack_class stack[];
int debug=0;
byte b[];
int next1;
int next2;
String gstring;
int shifthandling=1;
int nodraw=0;

void setup() {
  size(640, 480);
  frameRate(10);
  // noLoop();
//b = new byte[300000];

  stack = new stack_class[numstacks+2];

  for (int i=0; i<numstacks; i++) stack[i]=new stack_class(i);

  for (int i=0; i<numstacks-1; i++) stack[i].nextstack = stack[i+1];
  stack[numstacks-1].nextstack = null;

  executephase();
}

void draw()
{
  if (nodraw==1) return;

  background(0);
  fill(255);
  int myy=400;

  for (int j= 0; j<numstacks-1; j++)
    for (int i =0; i<stack[j].arraysize; i++)
    {
      int separation=40;

      int centerx = (separation/2)*(stack[j].arraysize-1);

      int c1 = (char)stack[j].indexa[i];
      int c2 = (char)stack[j].indexb[i];

      if (c1>255) c1=63;
      if (c2>255) c2=63;
      if (j==0) text(""+(char)c1+","+(char)c2, 300+i*separation-centerx, myy-j*40);
      else  text(""+stack[j].indexa[i]+","+stack[j].indexb[i], 300+i*separation-centerx, myy-j*40);

      textSize(10);

      text("DECODE THE MESSAGE!",20,20);
      text("Place mouse over a node. ALWAYS follow a green line down until you get two letters.",20,40);
      text("Move up one. Follow red. Repeat if unused green line is available otherwise move up one and repeat.",20,60);
      text(""+j+"-"+i, 300+i*separation-centerx, myy-j*40-18);
      textSize(12);

      if (mouseX>300+i*separation-centerx)
        if (mouseX<320+i*separation-centerx)
          if (mouseY>myy-10-j*40)
            if (mouseY<myy-j*40)
            {
              gstring="";
              extractdraw(j, i,310+i*separation-centerx, myy-5-j*40);
              text("STACK "+j+" node "+i+" recurses to "+gstring, 50, myy+30);
            }

      noFill();
      stroke(255);
      rectMode(CENTER);
      rect(310+i*separation-centerx, myy-5-j*40, separation-15, 20);
    }

  int ycord=200;

  for (int j=0; j<numstacks-1;j++)
  {
    if (stack[j].hold==-1) continue;

    if (j==0) text("Stack "+j+" + the letter or number ("+(char)(stack[j].hold)+")", 10, ycord);
    else text("Stack "+(j-1)+" node "+stack[j].hold, 10, ycord);
    ycord-=20;
  }

  //
}


void encode()
{
  int updater=10000;
  int percent=0;

  println("Input length:"+b.length); 

  for (int i = 0, n = b.length ; i < n ; i++) { 
    dbug("Draw function calling addstack 0,"+(char)b[i]);

    if (updater<1) {
      updater=10000;  
      percent = (int)(((float)i/(float)b.length)*100);
      println("At char: "+i+" of "+b.length+" "+percent+"%");
    }
    updater--;

    if (i+1<n) next1 = b[i+1];
    else next1=-1;

    if (i+2<n) next2 = b[i+2];
    else next2=-1;

    addstack(0, b[i]);
    dbug("---------");
  }
}


void arraystats()
{
  int asize=0;
  for (int j=0; j<numstacks; j++)
  {
    asize+=stack[j].arraysize;
  }
  println("Size of arrays combined:"+asize);
}

void executephase() 
{
  int carry=0;
  
  String s;

// Uncomment these to to read from 1.txt  
//  println("1.txt");
//  b= loadBytes("1.txt");

// comment these out to read from 1.txt
// or change PROCESSING to say something else.
    s = "PROCESSING";
    b = s.getBytes(); // how to convert a string to bytes in java

/* for (int i=0; i<300000; i++)
  {
    b[i] = (byte) (i%255);
    if ( (int)random(10)==1 )  b[i] =  (byte)random(255);
  }
  saveBytes("1.txt",b);
 */
 	

  
  encode();
  arraystats();
  // stack[0].output();
  //  outputsizes();
  create_regencode();
  //  clearholds();

  // note in this version due to the binary tree and moving indexes the previous list of nodes will change after new information is added.
  // by adding id's to the fields the nodes may easily be fixed for the list of nodes which represent file input.
  // better solutions are being searched for by programmers. the easiest version to work with currently does not use a binary tree and all new data is appended.
  // see the php version for system which allows different sets of data to be placed into the same hierarchy.
  
  /*  
   println("2.txt");
   b= loadBytes("2.txt");
   encode();
   //  arraystats();
   stack[0].output();
   //  outputsizes();
   create_regencode();
   clearholds();
   

   */

  // show the stacks values
  // for (int j=0; j<numstacks; j++) {
  //   println("Stack #"+j);
  //  stack[j].output();
  //  }

  //  println("--extract--");

  //extractfromtop();

  //  extract(2,1);
}

public void extractfromtop()
{
  for (int j=numstacks-1; j>=0; j--)
  {
    if (stack[j].hold==-1) continue;

    if (j==0) {
      print((char)(stack[j].hold));
    }
    else
    {
      extract(j-1, stack[j].hold);
    }
  }
}

public void extract(int stackindex, int index)
{
  if (index==999999) return;

  //println(""+stackindex+" "+index);
  int a = stack[stackindex].indexa[index];
  int b = stack[stackindex].indexb[index];

  if (stackindex==0)
  {
    if (a<255) print( (char)a );
    if (b<255) print( (char)b );
    return;
  }

  int x = stack[stackindex].nodehits[index];
  // if ((x<4) || (stackindex>1)) // lossy regeneration cutting out most used info
  {
    if (a!=999999) extract(stackindex-1, stack[stackindex].indexa[index]);
    if (b!=999999) extract(stackindex-1, stack[stackindex].indexb[index]);
  }
}




public void extractdraw(int stackindex, int index, int x,int y)
{
  if (index==999999) return;
  
  //println(""+stackindex+" "+index);
  int a = stack[stackindex].indexa[index];
  int b = stack[stackindex].indexb[index];

  int separation=40;
  int centerx = (separation/2)*(stack[stackindex].arraysize-1);
  int myy=400;

 // ellipse(x,y,20,20);
// 310+i*separation-centerx, myy-5-j*40
  line(x,y,310+index*separation-centerx, myy-5-stackindex*40);
  
  x = 310+index*separation-centerx;
  y = myy-5-stackindex*40;
  
  if (stackindex==0)
  {
    if (a<255) gstring+=(char)a;
    if (b<255) gstring+=(char)b;
    return;
  }

//  int nh = stack[stackindex].nodehits[index];
  // if ((x<nh) || (stackindex>1)) // lossy regeneration cutting out most used info
  {
    stroke(0,255,0);
    
    if (a!=999999) extractdraw(stackindex-1, stack[stackindex].indexa[index],x-10,y);
    
    stroke(255,0,0);
    if (b!=999999) extractdraw(stackindex-1, stack[stackindex].indexb[index],x+10,y);
  }
}

public void extracts(int stackindex, int index)
{
  if (index==999999) return;

  
  //println(""+stackindex+" "+index);
  int a = stack[stackindex].indexa[index];
  int b = stack[stackindex].indexb[index];

  if (stackindex==0)
  {
    if (a<255) gstring+=(char)a;
    if (b<255) gstring+=(char)b;
    return;
  }

  int x = stack[stackindex].nodehits[index];
  // if ((x<4) || (stackindex>1)) // lossy regeneration cutting out most used info
  {
    if (a!=999999) extracts(stackindex-1, stack[stackindex].indexa[index]);
    if (b!=999999) extracts(stackindex-1, stack[stackindex].indexb[index]);
  }
}


void create_regencode()
{
  for (int j=numstacks-1; j>=0; j--)
  {
    if (stack[j].hold==-1) continue;

    if (j==0) println("Stack "+j+" node "+(char)(stack[j].hold));
    else println("Stack "+(j-1)+" node "+stack[j].hold);
  }
}

void clearholds()
{
  for (int i=0; i<numstacks; i++) stack[i].hold = -1;
}

void addstack(int stacknum, int value)
{
  int index;

  dbug("Addstack: calling stacknum "+stacknum+".go("+value+")");
  index = stack[stacknum].go(value);
  if (index==-1) return;
  else addstack(stacknum+1, index);
}

void dbug(String s)
{
  if (debug==1) println(s);
}


void outputsizes()
{
  for (int i=0; i<numstacks; i++)
    println("Stack "+i+" arraysize: "+stack[i].arraysize+" holding: "+stack[i].hold);
}


class stack_class
{
  int indexa[];
  int indexb[];
  int nodehits[];

  int arraysize=0;
  int currentid=0;
  int search1=0;
  int mystacknum=0;

  int mid=0;
  int hold=-1;
  stack_class nextstack;

  stack_class(int _mystacknum)
  {
    mystacknum=_mystacknum;

    int defaultsize=1000;

    if (mystacknum==0) defaultsize=65536;
    if (mystacknum==1) defaultsize=50000;
    if (mystacknum==2) defaultsize=40000;
    if (mystacknum==3) defaultsize=30000;
    if (mystacknum==4) defaultsize=20000;
    if (mystacknum==5) defaultsize=10000;
    if (mystacknum==6) defaultsize=9000;
    if (mystacknum==7) defaultsize=8000;
    if (mystacknum==8) defaultsize=7000;
    if (mystacknum==9) defaultsize=6000;
    if (mystacknum==10) defaultsize=5000;

    indexa = new int[defaultsize];
    indexb = new int[defaultsize];
    nodehits = new int[defaultsize];

    int i;
    for ( i=0; i<arraysize; i++)
    {
      indexa[i]=0;
      indexb[i]=0;
    }
  }


  void output()
  {
    for (int i=0; i<arraysize; i++)
    {
      //for (int j=0; j<=mystacknum; j++) print(".");
      if (mystacknum==0) println("Index "+i+" holds "+(char)indexa[i]+","+(char)indexb[i]+" Nodehits "+nodehits[i]);
      else println("Index "+i+" holds "+indexa[i]+","+indexb[i]+" Nodehits "+nodehits[i]);
    }
  }

  int go(int key)
  {
    dbug("Stack "+mystacknum+" GO: key="+key);

    if (shifthandling==1)
    {
      // got two letters, if not found see if shift one over is, if so 
      if (hold==-1)
      {
        // if hold plus the next letter coming is not found
        if (indexof(key, next1)==-1) 
          if (indexof(next1, next2)>-1) 
          {
            hold=999999;
          }
      }

      // temporal shifting
      // if not holding one now and got one (key) and the next two exist then do the *
      if (hold==-1) {
        if (indexof(next1, next2)>-1) {
          hold=key;
          key=999999;
        } // asterisk
      }
    }

    if (hold==-1) {
      hold=key;
      dbug("Stack "+mystacknum+" Holding "+hold);
      return -1;
    }
    else {
      int temp;

      dbug("Got second at stack "+mystacknum);
      if (debug==1) output();
      dbug("Calling go2 hold="+hold+" key=" + key);
      temp =  go2(hold, key);

      dbug("OUTPUT OF STACK "+mystacknum);
      if (debug==1) output();
      dbug("Returning "+temp);
      return temp;
    }
  }

  int go2(int key1, int key2)
  {
    int index=0;
    int mykey = key1*65536+key2;
    dbug("Stack "+mystacknum+" Called Go2:("+key1+","+key2+") - mykey "+mykey);
    dbug("Stack "+mystacknum+" Calling indexof:");
    index = indexof(key1, key2);
    dbug ("Stack "+mystacknum+" Call indexof(key1,key2) result: "+index);
    hold=-1;

    if (index==-1)
    {
      int insertpoint=0;

      dbug("Did not find it in the list.");
      dbug("Middle:"+mid);
      if (arraysize==0) {
        insertpoint=0;
      }
      else
        if ((mykey>(indexa[mid]*65536+indexb[mid]))) { 
          dbug("insert right of "+mid+" at "+(mid+1));
          insertpoint=mid+1;
        }
        else {
          insertpoint=mid;
          dbug("insert at "+mid+" at "+insertpoint);
        }

      if (arraysize<insertpoint+1) {
        arraysize=insertpoint+1;
        dbug("arraysize = insertpoint+1 "+arraysize);
      }
      else {
        arraysize++;
        dbug("arraysize++ "+arraysize);
      }

      if (arraysize==indexa.length-1) println("increase arraysize ("+arraysize+") for stack "+mystacknum);
      dbug("for (int i="+(arraysize-1)+"; i>"+insertpoint+"; i--)");
      for (int i=arraysize-1; i>insertpoint; i--)
      {
        indexa[i]=indexa[i-1];
        indexb[i]=indexb[i-1];
        nodehits[i]=nodehits[i-1];
      }

      indexa[insertpoint] = key1;
      indexb[insertpoint] = key2;

      // increment all nodes above that point to this insertpoint or greater
      dbug("next stack ("+(mystacknum+1)+" arraysize "+nextstack.arraysize);
      for (int node=0; node<nextstack.arraysize; node++)
      {
        dbug("fix upper nodes in stack "+(mystacknum+1)+" which point to "+insertpoint+" or greater by adding 1");
        if ( (nextstack.indexa[node]>=insertpoint) && (nextstack.indexa[node]!=999999) ) {
          nextstack.indexa[node]++;
          dbug("increment indexa node "+node);
        }
        if ( (nextstack.indexb[node]>=insertpoint) && (nextstack.indexb[node]!=999999) ) {
          nextstack.indexb[node]++;
          dbug("increment indexb node "+node);
        }
      }

      if (nextstack.hold>=insertpoint) 
      {
        nextstack.hold++;
        dbug("incremented hold on stack "+(mystacknum+1)+" to "+nextstack.hold);
      }

      dbug("Inserted at "+insertpoint+" key1 "+key1+" key2 "+key2+" sorted as "+mykey);
      index = insertpoint;
    }

    nodehits[index]++;
    return index;
  }


  public int indexof(int k1, int k2) {
    int lo = 0;
    int hi = arraysize-1;
    int value;

    int mykey = k1*65536+k2; //k1 + k2*256;

    if (arraysize==0) return -1;
    if (hi<0) hi=0;

    while (lo <= hi) {
      // Key is in a[lo..hi] or not present.
      mid = lo + (hi - lo) / 2;
      value = indexa[mid]*65536+indexb[mid];

      dbug("indexof: Stack:"+mystacknum+" while("+lo+" <= "+hi+") mid "+mid+" value "+value+" mykey "+mykey);

      if (mykey < value) hi = mid - 1;
      else if (mykey > value) lo = mid + 1;
      else return mid;
    }

    return -1;
  }
}


