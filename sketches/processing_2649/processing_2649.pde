
//import .*;
Treemap treemap;
MyTreeMap MyMap;

Vector rects = new Vector();
Vector names = new Vector();
MyParser tp;
int level = 0;
MPMap mapData, topLevel;
Details cabinet = new Details();
Details back_bench = new Details();
Details mps = new Details();
PFont font20, font15, font14, font8, font6;

void setup()
{
  
  size(800, 600);

  smooth();
  strokeWeight(0.25f);
  font6 = createFont("Serif",6);
  font8 = createFont("Serif",8);
  font14 = createFont("Serif",14);
  font15 = createFont("Serif",15);
  font20 = createFont("Serif",20);

  textFont(font8);

  //tp = new MyParser("data/HoCMP.xml");
  tp = new MyParser("http://www.bikefacts.co.uk/processing/HOC/data/HoCMP.xml");
  
  topLevel = new MPMap();

  Details rr = getParty(getResponseRate(tp, "Party", "Name"));

  for (int i = 0; i < rr.Size(); i++)
  {
    for (int j = 0; j < rr.getSize(i); j++)
    {
      topLevel.addWord(rr.getName(i));
    }
  }         

  topLevel.finishAdd();

  processLevel(level);

}

void draw()
{
  background(255);
  if (level == 0)
  {
    textFont(font15);
  }
  else if (level == 1)
  {
    textFont(font20);
  }
  else if (level == 2)
  {
    textFont(font6);
  }
  MyMap.draw();    

  textFont(font8);

  if (level == 2)
  {
    int rectW = 200, rectH = 40, mouseXdiff = 10, mouseYdiff = 50, mouseYText1 = 35, mouseYText2 = 20;

    for (int i = 0; i < rects.size(); i++)
    {
      Rect t = (Rect)rects.get(i);
      if ((mouseY >= (int)t.y && mouseY <= (int)(t.h+t.y)) && (mouseX >= (int)t.x && mouseX <= (int)(t.w+t.x)))
      {
        boolean found = false;
        for (int j = 0; j < mps.Size() && !found; j++)
        {
          if (names.get(i).toString() == mps.getName(j).toString())
          {
            if ((mouseX-mouseXdiff)+rectW >= width)
            {
              mouseXdiff = mouseX-590;
            }
            if (mouseY < (rectH+mouseYdiff))
            {
              mouseYdiff = 0;
              mouseYText1 = -20;
              mouseYText2 = -35;
            }

            fill(255);
            rect(mouseX-mouseXdiff,mouseY-mouseYdiff,rectW,rectH);
            fill(0);
            textAlign(CENTER);

            textFont(font14);
            text(mps.getName(j).toString()+" has a ", (mouseX-mouseXdiff)+110, mouseY-mouseYText1);
            text("response rate of "+mps.getSize(j)+"% ",(mouseX-mouseXdiff)+110, mouseY-mouseYText2);
            found = !found;
            textFont(font8);
          }
        }
      }
    }
  }
}

public void processLevel(int level)
{

  if (level == 0)
  {
    if (topLevel != null)
    {
      MyMap = new MyTreeMap(topLevel, 0, 0, width, height);
      treemap = MyMap;
    }

    Mappable[] model = topLevel.getItems();

    rects = new Vector();
    names = new Vector();

    for (int i = 0; i < model.length; i++)
    {
      rects.add(model[i].getBounds());
      names.add(((MP)model[i]).getName());
    }

  }
  else if (level == 1)
  {
    for (int i = 0; i < rects.size(); i++)
    {
      Rect t = (Rect)rects.get(i);
      if ((mouseY >= (int)t.y && mouseY <= (int)(t.h+t.y)) && (mouseX >= (int)t.x && mouseX <= (int)(t.w+t.x)))
      {       
        if (cabinet.Size() == 0 && back_bench.Size() == 0)
        {
          mps = getMPs(tp, "Party", "Percent", "Name", names.get(i).toString());
          int leaderid = getLeader(mps);
          cabinet = getRole(mps, true);
          back_bench = getRole(mps, false);
        }

        mapData = new MPMap();

        for (int l = 0; l < cabinet.Size(); l++)
        {
          for (int m = 0; m < cabinet.getSize(l); m++)
          {
            mapData.addWord("Cabinet");
          } 
        }

        for (int k = 0; k < back_bench.Size(); k++)
        {
          for (int j = 0; j < back_bench.getSize(k); j++)
          {
            mapData.addWord("Back Bench");
          }
        }

      }
    }

    mapData.finishAdd();      

    if (mapData != null)
    {
      MyMap = new MyTreeMap(mapData, 0, 0, width, height);
      treemap = MyMap;
    }

    Mappable[] model = mapData.getItems();

    rects = new Vector();
    names = new Vector();

    for (int i = 0; i < model.length; i++)
    {
      rects.add(model[i].getBounds());
      names.add(((MP)model[i]).getName());
    }
  } 
  else if (level == 2)
  {
    Details mps = new Details();
    for (int i = 0; i < rects.size(); i++)
    {
      Rect t = (Rect)rects.get(i);

      if ((mouseY >= (int)t.y && mouseY <= (int)(t.h+t.y)) && (mouseX >= (int)t.x && mouseX <= (int)(t.w+t.x)))
      {
        if (names.get(i).toString() == "Cabinet")
        {
          mps = cabinet; 
        }
        else if (names.get(i).toString() == "Back Bench")
        {
          mps = back_bench;
        }
      }
    }

    mapData = new MPMap();

    for (int k = 0; k < mps.Size(); k++)
    {
      for (int j = 0; j < (int)mps.getSize(k); j++)
      {
        mapData.addWord(mps.getName(k));
      }
    }

    mapData.finishAdd();      

    Mappable[] model = mapData.getItems();

    rects = new Vector();
    names = new Vector();

    for (int i = 0; i < model.length; i++)
    {
      rects.add(model[i].getBounds());
      names.add(((MP)model[i]).getName());
    }

    if (mapData != null)
    {
      MyMap = new MyTreeMap(mapData, 0, 0, width, height);
      treemap = MyMap;
    }

  } 

}

public Details getParty(Details b)
{

  double Cper = 0, Lper = 0, Ldper = 0, Snpper = 0, dupper = 0, rper = 0, uppper = 0, pcper = 0, iper = 0;
  int Ccount = 0, Lcount = 0, Ldcount = 0, Snpcount = 0, dupcount = 0, rcount = 0, uppcount = 0, pccount = 0, icount = 0;

  for (int i = 0; i < b.Size(); i++)
  {
    if (b.getName(i).equalsIgnoreCase("Conservative"))
    {
      Cper = Cper + b.getSize(i);
      Ccount++;
    }
    if (b.getName(i).equalsIgnoreCase("Labour"))
    {
      Lper = Lper + b.getSize(i);
      Lcount++;
    }
    if (b.getName(i).equalsIgnoreCase("Liberal Democrats"))
    {
      Ldper = Ldper + b.getSize(i);
      Ldcount++;
    }
    if (b.getName(i).equalsIgnoreCase("SNP"))
    {
      Snpper = Snpper + b.getSize(i);
      Snpcount++;
    }
    if (b.getName(i).equalsIgnoreCase("Respect"))
    {
      rper = rper + b.getSize(i);
      rcount++;
    }
    if (b.getName(i).equalsIgnoreCase("DUP"))
    {
      dupper = dupper + b.getSize(i);
      dupcount++;
    }
    if (b.getName(i).equalsIgnoreCase("Independent"))
    {
      iper = iper + b.getSize(i);
      icount++;
    }
    if (b.getName(i).equalsIgnoreCase("UUP"))
    {
      uppper = uppper + b.getSize(i);
      uppcount++;
    }
    if (b.getName(i).equalsIgnoreCase("Plaid Cymru"))
    {
      pcper = pcper + b.getSize(i);
      pccount++;
    }
  }
  Details parties = new Details();
  parties.add("Conservative", Cper/Ccount);
  parties.add("Labour", Lper/Lcount);
  parties.add("Liberal Democrats", Ldper/Ldcount);
  parties.add("SNP", Snpper/Snpcount);
  parties.add("Respect", rper/rcount);
  parties.add("DUP", dupper/dupcount);
  parties.add("Independent", iper/icount);
  parties.add("UUP",uppper/uppcount);
  parties.add("Plaid Cymru", pcper/pccount);

  return parties;
}

public Details getResponseRate(MyParser tp, String desc, String value)
{
  Vector t = tp.List(desc);
  Details details = new Details();
  Vector res = new Vector();
  for (int i = 0; i < t.size(); i++)
  {                
    Vector r = tp.List(desc,"MessagesSent",value,t.get(i).toString());
    Vector messages = new Vector();
    Vector response = new Vector();
    Vector percentage = new Vector();
    for (int j = 0; j < r.size(); j++)
    {
      percentage = tp.List(value, "Percent", r.get(j).toString());
      details.add(t.get(i).toString(), (int)Double.parseDouble(percentage.get(0).toString()));
    }
  }

  return details;
}

public double getPercent(Vector messages, Vector response)
{

  double lp = 0.0;
  int mess = 0, resp = 0;

  if (messages.size() == response.size())
  {
    for (int j = 0; j < messages.size(); j++)
    {                    
      mess = mess + Integer.parseInt(messages.get(j).toString());
      resp = resp + Integer.parseInt(response.get(j).toString());
    }
  }

  return ((double)resp / (double)mess)*100;         
}

public Details getMPs(MyParser b, String col1, String col2, String col3, String value)
{

  Vector Names = b.List(col1, col2, col3, value);
  Vector Percents = b.List(col1, col3, col2, value);
  Vector Reportsto = b.List(col1,col2,"ReportsTo",value);
  Vector ids = b.List(col1,col2,"ID",value);
  Vector roles = b.List(col1,col2,"Role",value);

  Details mps = new Details();
  for (int i = 0; i < Names.size(); i++)
  {
    mps.add(Names.get(i).toString(),Double.parseDouble(Percents.get(i).toString()),Integer.parseInt(Reportsto.get(i).toString()),Integer.parseInt(ids.get(i).toString()), roles.get(i).toString());
  }

  return mps;
}

public Details getRole(Details mps, boolean cabinet)
{    
  Details result = new Details();
  for (int i = 0; i < mps.Size(); i++)
  {
    String t = mps.getRole(i).toString();
    boolean r = t.startsWith("Back B");
    if (cabinet && !r)
    {
      result.add(mps.getName(i), mps.getSize(i), mps.getReportsTo(i), mps.getId(i), mps.getRole(i));
    }
    else if (!cabinet && r)
    {
      result.add(mps.getName(i), mps.getSize(i), mps.getReportsTo(i), mps.getId(i), mps.getRole(i));
    }
  }

  return result;
}

public int getLeader(Details mps)
{
  int leaderid = -999;
  boolean found = false;
  for (int i = 0;  i < mps.Size() && !found; i++)
  {
    if (mps.getId(i) == mps.getReportsTo(i))
    {
      leaderid = mps.getId(i);
      found = true;
    }
  }
  return leaderid;
}

void mousePressed()
{
  if (mouseButton == LEFT)
  {
    if (level < 2)
    {
      level++;
      processLevel(level);
    }

  }
  else if (mouseButton == RIGHT)
  {
    if (level >0)
      level--;
    if (level == 0)
    {
      cabinet = new Details();
      back_bench = new Details();
    }          
    processLevel(level);        
  }
}



