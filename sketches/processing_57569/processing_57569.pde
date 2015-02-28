
class Flagger implements Runnable {
  ///// countryflags variable
  PImage flags, world;
  PGraphics myFlag;
  String[] rawOffsets;
  URL url;
  String reply = "";

  PVector pos;

  boolean hasflag = false;

  ArrayList flagList = new ArrayList();

  String ip;
  String code;
  String longitude;
  String latitude;
  String city;

  float lon, lat;

  Flagger() {


    rawOffsets = loadStrings("offsets.txt");
    flags = loadImage("flags.png");
    world = loadImage("world.png");
  }

  void run() {
    println("locating user ...");

    locate();

    if (code!=null) {
      makeFlagList();

      plotFlag();

      lon = parseFloat(longitude);

      lat = parseFloat(latitude);


      pos = new PVector(map(lon, -168, 190, 7, 697), map(lat, 71, -77.9, 36, 329));
    }
  }

  PVector coordsToXY(float _lon, float _lat) {
    return new PVector(map(_lon, -168, 190, 7, 697), map(_lat, 71, -77.9, 36, 329));
  }

  void plotFlag() {


    myFlag = createGraphics(16, 11, JAVA2D);
    myFlag.beginDraw();

    for (int i = 0 ; i < flagList.size();i++) {
      Flag tmp = (Flag)flagList.get(i);
      if (tmp.name.equals(code.toLowerCase())) {
        myFlag.image(flags, tmp.x, tmp.y);
      }
    }

    myFlag.endDraw();

    hasflag = true;
  }

  PImage plotFlag(User usr) {

    PGraphics tmpFlag;

    tmpFlag = createGraphics(16, 11, JAVA2D);
    tmpFlag.beginDraw();

    for (int i = 0 ; i < flagList.size();i++) {
      Flag tmp = (Flag)flagList.get(i);
      if (tmp.name.equals(usr.code.toLowerCase())) {
        tmpFlag.image(flags, tmp.x, tmp.y);
      }
    }

    tmpFlag.endDraw();

    return (PImage)tmpFlag;
  }

  void locate() {

    try {
      url = new URL("http://xxxxxxxxxxxxxxxxxxxxxx");


      try {
        URLConnection yc = url.openConnection();


        BufferedReader in = new BufferedReader(new InputStreamReader(
        yc.getInputStream()));
        String inputLine;
        while ( (inputLine = in.readLine ()) != null) {

          reply+=inputLine;
        }
        in.close();
      }
      catch(IOException ee) {
      }
    }
    catch(MalformedURLException e) {
    }



    String results[] = splitTokens(reply, ",");

    println(results);

    if (results[0].equals("OK")) {
      ip = results[1];

      code = results[2];

      latitude = results[7];
      longitude = results[8];
      city = results[5];
    }
  }




  void makeFlagList() {

    flagList = new ArrayList();

    for (int i = 0 ; i < rawOffsets.length;i++) {
      String lin[] = splitTokens(rawOffsets[i], " ");
      String countryCode = lin[0];
      int x = parseInt(lin[1]);
      int y = parseInt(lin[2]);

      flagList.add(new Flag(countryCode, x, y));
    }
  }
}



class Flag {

  String name;
  int x, y;

  Flag(String _name, int _x, int _y) {
    name = _name+"";
    x=_x;
    y=_y;
  }
}

class User {
  String userName;
  String code;
  float lat, lon;
  PVector pos;
  PImage flag;

  User(String _un, String _c, float _lon, float _lat) {
    userName=_un;
    code=_c;
    lat=_lat;
    lon=_lon;
  }
}

void addUser(User novacek) {

  boolean hasAlready = false;
  for (int i = 0 ; i < rawUsers.size();i++) {
    User old = (User)rawUsers.get(i);
    if (novacek.userName.equals(old.userName))
      hasAlready = true;
  }

  if (!hasAlready)
    rawUsers.add(novacek);

  novacek.flag = locator.plotFlag(novacek);
  novacek.pos = locator.coordsToXY(novacek.lon, novacek.lat);
}

void rmUser(String _name) {
  println("-------"+_name+"---------");
  for (int i = 0 ; i < rawUsers.size();i++) {
    User old = (User)rawUsers.get(i);
    if (old.userName.equals(_name)) {
      rawUsers.remove(old);
    }
  }
}


