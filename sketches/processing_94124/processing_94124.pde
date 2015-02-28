

import java.util.*;

String[] raw = new String[101];

int[] population = new int[101];

long[] realPop = new long[101];

ArrayList<Long> people = new ArrayList<Long>();
 
ArrayList<Integer> loc = new ArrayList<Integer>();

int date = 2000;

double[] speed = new double[101];


void setup(){

  size(800,400);

  

  raw = loadStrings("data.txt");
 
  for(int i = 0; i < raw.length; i++){

    String[] x = raw[i].split(":");

    population[i] = (int)(Long.parseLong(x[1])/100000000*2);

    realPop[i] = Long.parseLong(x[1]);
    speed[i] = Double.parseDouble(x[2]);
    System.out.println(population[i]);

  

}

  for(int i = 0; i < population[(date-1950)]; i++){

    loc.add(-1);

  }

  for(int i = 0; i < population[(date-1950)]; i++){
 
    loc.set(i, (int)random(0,800));

  }

}




void draw(){

  background(0);

  makePeople();

  drawPeople();

  date = getDate();

   text("World Population: " + realPop[date-1950],0,300);
   text("Annual Growth Rate: " + speed[date-1950]+"%",0,320);
}




int getDate(){

  if(mouseX/8+1950 != date){

    for(int i = 0; i < loc.size(); i++){

       loc.set(i,-1);

    }

    for(int i = 0; i < population[(date-1950)]; i++){

      loc.set(i, (int)random(0,800));

    }




  }

  text("Year: " + (mouseX/8+1950), 0, 280);
 
  return mouseX/8+1950;

}







void makePeople(){

  int index = date-1950;

  int pop = population[index];

  while(pop > loc.size()){
 
    loc.add(-1);

  }

  int dir = 1;

  for(int i = 0; i < pop; i++){

    int rand = (int)random(0,100);

    if(rand >95){

      dir = dir*-1;

     }

    /*if(loc.get(i)+dir*2 > 800){

      dir = dir*-1;

    } else if(loc.get(i)+dir*2 < 0){

      dir = dir*-1;

    }*/

    loc.set(i,loc.get(i)+(int)(1.5*dir*(.7+speed[date-1950])));
 
  }

}




void drawPeople(){

  for(int i = 0; i < loc.size();i++){

    ellipse(loc.get(i),200, 6, 6);

  }

}

