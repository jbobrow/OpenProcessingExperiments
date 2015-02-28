
int ROWS = 30;
int SEATS = 6;
int WID = 15;
int RATE = 15;

int GROUPS = 3;

int rtime = 0;
int otime = 0;
int ctime = 0;

//0 - starting current
//1 - current ordering (random within groups)
//2 - starting random ordering
//3 - totally random ordering
//4 - starting optimal
//5 - optimal method
//6 - conclusion
//7 - done
int activity = 0;

int[] seats = new int[ROWS*(SEATS+1)];
ArrayList queue = new ArrayList();
ArrayList people = new ArrayList(); 

//WIDTH=500;
//HEIGHT=500;

void initializeRandom()
{
  people.clear();
  queue.clear();
  for(int i = 0 ; i < ROWS*SEATS ; i++)
    people.add(new Integer(i));
    
  while(people.size() != 0) {
    int where = (int)random(people.size());
    int passenger = (Integer)people.get(where);
    queue.add(passenger);
    people.remove(where);
  }
 
  println(queue.size());
  
  for(int i = 0 ; i < ROWS*(SEATS+1) ; i++)
    seats[i] = -1;
}

void initializeDefault()
{
  people.clear();
  queue.clear();
  for(int i = 0 ; i < ROWS*SEATS ; i++)
    people.add(new Integer(i));
  println(people);
//  chair = pos/ROWS;
//  row = pos%ROWS;
  ArrayList tmp = new ArrayList();

  for(int gg = GROUPS-1 ; gg >= 0; gg--) {
    //choose random 
    println("Section: " + (gg*ROWS*SEATS/GROUPS) + " " + ((gg+1)*ROWS*SEATS/GROUPS));
    for(int ii = 0 ; ii < ROWS*SEATS/GROUPS ; ii++) {
      int who = (int)random(gg*ROWS*SEATS/GROUPS, 
            (gg+1)*ROWS*SEATS/GROUPS-ii);
      int passenger = (Integer)people.get(who);
      int chair = passenger%SEATS;
      int row = passenger/SEATS;
      passenger = chair*ROWS + row;
      tmp.add(passenger);
      people.remove(who);
    }
  }
  
  //reverse
  for(int ii = tmp.size()-1 ; ii >= 0 ; ii--) {
    queue.add(tmp.get(ii));
  }
  
  println(queue);
  
  for(int i = 0 ; i < ROWS*(SEATS+1) ; i++)
    seats[i] = -1;
}

void initializeRandomSeatOrdered()
{
  people.clear();
  queue.clear();
  for(int i = 0 ; i < ROWS*SEATS ; i++)
    people.add(new Integer(i));
    
  for(int gg = SEATS-1 ; gg >= 0; gg--) {
    while(people.size() != 0) {
      int where = (int)random(gg*people.size()/SEATS, 
            (gg+1)*people.size()/SEATS);
      int passenger = (Integer)people.get(where);
      queue.add(passenger);
      people.remove(where);
    }
  }

  println(queue.size());
  
  for(int i = 0 ; i < ROWS*(SEATS+1) ; i++)
    seats[i] = -1;
}

void initializeOptimal()
{
  people.clear();
  queue.clear();
  for(int i = 0 ; i < ROWS*SEATS ; i++) {
    people.add(new Integer(i));
  }
  
  queue = new ArrayList(people);
  people.clear();
  //reverse

  for(int i = 0 ; i < ROWS*(SEATS+1) ; i++)
    seats[i] = -1;
}

void setup()
{
  background(1,1,0);
  size(600, 600);
  colorMode(HSB, 1);
  println(width);
  println(height);
  frameRate(30);
  smooth();
  
  for(int i = 0 ; i < ROWS*(SEATS+1) ; i++)
    seats[i] = -1;
}

void update()
{
  println(queue);
  println("Updating");
  //update positions
  int curr = ROWS;
  int chair = 0;
  int row = ROWS;
  for(int i = queue.size()-1 ; i >= 0 &&  curr >= 0 ; i--) {
    int pos = (Integer)queue.get(i);
    chair = pos/ROWS;
    row = pos%ROWS;
    if(seats[row+SEATS*ROWS] == pos) {
      println("Moving " + row + ", " + chair + " in");
      seats[row+SEATS*ROWS] = -1;
      seats[row+chair*ROWS] = pos;
      for(curr = row;curr < ROWS; curr++) {
        if(seats[curr + SEATS*ROWS] != -1) 
          break;
      }
      //subject is now seated
      queue.remove(i);
    } else {
      //remove from old location
      for(int j = 0 ; j < ROWS; j++) {
        if(seats[j + SEATS*ROWS] == pos) {
          seats[j + SEATS*ROWS] = -1;
        }
      }

      //move to seat position, and move curr to that
      if(row < curr) {
        //move to new position
        println("Moving " + row + ", " + chair + " to " + row);
        seats[row + SEATS*ROWS] = pos;
        curr = row-1;
      //move up as far as possible
      } else {
        println("Moving " + row + ", " + chair + " to " + curr);
        seats[curr+SEATS*ROWS] = pos;
        curr--;
      }
    }
  }
}

int COUNT = 2;
int time = 0;
int count = 0;
void draw()
{
  background(0,0,0);
  
  switch(activity) {
   case 0:
     if(frameCount%RATE == 0) {
       count++;
       if(count > COUNT) {
         activity++;
         count = 0;
         initializeDefault();
         time = 0;
       }
     }
     fill(.3, 1, 1);
     textSize(40);
     textAlign(CENTER, CENTER);
     text("Boarding an Airplane:\nCurrent Method", width/2, height/2);
   break;
   case 2:
      if(frameCount%RATE == 0) {
       count++;
       if(count > COUNT) {
         activity++;
         count = 0;
         initializeRandom();
         time = 0;
       }
     }
     fill(.3, 1, 1);
     textAlign(CENTER, CENTER);
     textSize(40);
     text("Totally Random Ordering\nof Passengers", width/2, height/2);
   break;
   case 4:
     if(frameCount%RATE == 0) {
       count++;
       if(count > COUNT) {
         activity++;
         count = 0;
         initializeOptimal();
         time = 0;
       }
     }
     fill(.3, 1, 1);
     textSize(40);
     textAlign(CENTER, CENTER);
     text("Sorted By Seat\nthen Row", width/2, height/2);
   break;
   case 6:
     if(frameCount%RATE == 0) {
       count++;
       if(count > COUNT*3) {
         activity++;
         count = 0;
         time = 0;
       }
     }
     fill(0,0,1);
     textSize(40);
     textAlign(LEFT, CENTER);
     text("Current Method:", width/12, height/2-50);
     text("Random:", width/12, height/2);
     text("Optimal:", width/12, height/2+50);
     textAlign(RIGHT, CENTER);
     text(ctime + " steps", width-width/12, height/2-50);
     text(rtime + " steps", width-width/12, height/2);
     text(otime + " steps", width-width/12, height/2+50);
     break;
   case 7:
     exit();
     break;
   default:
      if(frameCount%RATE == 0) {
        update();
        time++;
      }
      
      fill(.1, 1, 1);
      textSize(30);
      textAlign(CENTER, CENTER);
      text("Time: " + time, width/6, height/2);

      fill(.98, 0, 1);
      textSize(40);
      textAlign(CENTER, CENTER);
      if(activity == 1)
        text("Current Method", width/2, height/20);
      else if(activity == 3)
        text("Random", width/2, height/20);
      else if(activity == 5)
        text("Optimal", width/2, height/20);

      fill(0, 1, 1);
      textSize(20);
      textAlign(CENTER, CENTER);
      text("Tail", width/2+2*WID, height/2-ROWS/2*WID-2);
      text("Cockpit", width/2+2*WID, height/2+ROWS/2*WID + WID*2);
      //draw
      for(int rr = 0 ; rr < ROWS ; rr++){
        for(int ss = 0 ; ss < SEATS+1; ss++) {
          if(seats[rr+ss*ROWS] == -1) {
            if(ss == SEATS)
              fill(1, 0, 0);            
            else
              fill(1, 0, 1);

          } else
            fill(seats[rr+ss*ROWS]/((float)ROWS*SEATS), 1, 1);
            
          if(ss == SEATS) {
            ellipse(width/2+2*WID, height/2+(ROWS/2-rr)*WID+WID/2, WID, WID);
          } else if(ss < SEATS/2.0) {
            rect(width/2 - (ss+1)*WID, height/2+(ROWS/2-rr)*WID, WID, WID);
          } else{
            rect(width/2 + (ss+1)*WID, height/2+(ROWS/2-rr)*WID, WID, WID);
          }
        }
      }
      if(queue.size() == 0 && frameCount > 100) {
        if(activity == 1)
          ctime = time;
        else if(activity == 3)
          rtime = time;
        else
          otime = time;
        activity++;
      }
    break;
  }
  

}

