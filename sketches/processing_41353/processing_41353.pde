
String      GFile          = "History-09-23-2011.kml";
boolean     GUseLocalImage = true; //Set to false to get image from web.
ArrayList   GPositions     = new ArrayList();
ArrayList   GTimes         = new ArrayList();
float       GTotalDistance = 0.0f;
float       GTotalDuration = 0.0f;
PImage      GImage;
PFont       GFont;

final float METERS_PER_DEGREE = 111319.9f;
final float MPS_TO_MPH        = 2.23693629f;
final float METERS_PER_MILE   = 1609.0f;
final float MAX_PATH_COORDS   = 90;

XMLElement GetChildNamed(XMLElement elem, String name)
{
    if (elem != null)
    {
        for (int i = 0; i < elem.getChildCount(); i++)
        {
            XMLElement child = elem.getChild(i);
            if (child.getName().equals(name))
            {
                return child;
            }
        }
    }
    return null;
}

PVector StringToVector(String s)
{
    PVector vec = new PVector();
    StringTokenizer st = new StringTokenizer(s, " ");
    if (st.hasMoreTokens())
        vec.y = Float.valueOf(st.nextToken().trim()).floatValue();
    if (st.hasMoreTokens())
        vec.x = Float.valueOf(st.nextToken().trim()).floatValue();
    return vec;
}

void setup()
{
    frameRate(1);
    size(512, 512);
    background(0);

    GFont = loadFont("SignikaNegative-Bold-28.vlw");
    textFont(GFont, 28);
    
    XMLElement xml       = new XMLElement(this, GFile);
    XMLElement doc       = GetChildNamed(xml,       "Document");
    XMLElement placemark = GetChildNamed(doc,       "Placemark");
    XMLElement track     = GetChildNamed(placemark, "gx:Track");
    
    Date date = new Date();
    DateFormat date_format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");

    for (int i = 0; i < track.getChildCount(); i++)
    {
        XMLElement child = track.getChild(i);
        if (child.getName().equals("when"))
        {
            String timestamp = child.getContent();
            timestamp = timestamp.replace('T', ' ');
            try
            {
                date = date_format.parse(timestamp);
            }
            catch (ParseException e)
            {
                println("Couldn't parse timestamp: " + timestamp);
            }
        }
        else if (child.getName().equals("gx:coord"))
        {
            PVector vec = StringToVector(child.getContent());
            if (GPositions.contains(vec) == false)
            {
                GPositions.add(vec);
                GTimes.add(date);
            }
        }
    }
    
    PVector range_min = new PVector( 180.0f,  90.0f, 0.0f);
    PVector range_max = new PVector(-180.0f, -90.0f, 0.0f);
    for (int i=0 ; i<GPositions.size() ; ++i)
    {
        range_min.x = min(range_min.x, ((PVector)GPositions.get(i)).x);
        range_min.y = min(range_min.y, ((PVector)GPositions.get(i)).y);
        range_max.x = max(range_max.x, ((PVector)GPositions.get(i)).x);
        range_max.y = max(range_max.y, ((PVector)GPositions.get(i)).y);
    }
    PVector middle = PVector.add(range_min, range_max);
    middle.mult(0.5f);
    
    PVector extent = PVector.sub(range_max, range_min);
    float twice_coord_range = 2.0f * max(extent.x, extent.y);
    int   map_zoom  = 0;
    float map_range = 360.0f;
    while (map_zoom < 21 && map_range>twice_coord_range)
    {
        ++map_zoom;
        map_range *= 0.5f;
    }
    
    String url = "http://maps.googleapis.com/maps/api/staticmap?sensor=false";
    url       += "&center=" + middle.x + "," + middle.y;
    url       += "&zoom=" + map_zoom;
    url       += "&size=" + width + "x" + height;
    url       += "&path=";
    
    for (int i=0 ; i<min(MAX_PATH_COORDS, GPositions.size()); ++i)
    {
        if (i>0) url += "|";
        url += ((PVector)GPositions.get(i)).x + "," + ((PVector)GPositions.get(i)).y;
    }
    
    for (int i=0 ; i<GPositions.size()-1; ++i)
    {
        PVector offset = PVector.sub((PVector)GPositions.get(i),
                                     (PVector)GPositions.get(i+1));
        offset.mult(METERS_PER_DEGREE);
        float distance = offset.mag();
        long duration = (((Date)GTimes.get(i+1)).getTime()-
                         ((Date)GTimes.get(i  )).getTime());
        duration *= 0.001;
        float speed = distance / (float) duration;
        println(""+(int)distance+"m\t in "+duration+"s\t = "+(int)(speed*MPS_TO_MPH) + "mph");
                     
        GTotalDistance += distance;
        GTotalDuration += duration;
    }
    
    if (GUseLocalImage)
    {
        GImage = loadImage("StaticMap.png");
    }
    else
    {
        GImage = loadImage(url, "png");
    }
}

void OutlineText(String s, int x, int y)
{
    fill(255);
    text(s, x+1, y+1);
    text(s, x-1, y-1);
    fill(200, 40, 10);
    text(s, x, y);
}

void draw()
{
    if (GImage != null)
    {
        image(GImage, 0, 0);
    }
    OutlineText(GFile,                                                                     30, 50 );
    OutlineText("Travelled " + (int)(GTotalDistance/METERS_PER_MILE) + " miles.",          30, 85 );
    OutlineText("Average "   + (int)((GTotalDistance/GTotalDuration)*MPS_TO_MPH) + " mph", 30, 120);
}

