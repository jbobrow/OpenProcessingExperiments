
HashMap things = new HashMap();
ArrayList thingList;

public static class AThing {
  static int ids = 0;
  private int id = ids++;
  public String who() { return "thing" + str(id); }
}

void setup() {
  size(400, 400);
  for (int i=0; i<5; i++) mousePressed();
}

void draw() {
  background(0);
  text("list"+str(thingList.size()), 100, 200);
  text("map"+str(things.size()), 200, 200);
  noLoop();
}

void mousePressed() {
  things.put( binary(things.size()), new AThing() );
  thingList = new ArrayList();
  for (
   Iterator it = things.entrySet().iterator();
   it.hasNext(); )
    thingList.add( it.next() );
  loop();
}                               
