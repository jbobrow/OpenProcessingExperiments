
public class SunAngle {
  // Based on formulae from http://www.providence.edu/mcs/rbg/java/sungraph.htm
  
  public Calendar datetime;
  public float latitude, longitude;
  
  SunAngle(float latitude, float longitude) {
    this.datetime = Calendar.getInstance();
    
    this.latitude = latitude;
    this.longitude = longitude;
  }  
  
  SunAngle(float latitude, float longitude, int month, int date, int year, int hour, int minute, int second) {
    this.datetime = Calendar.getInstance();
    this.datetime.set(year, month-1, date, hour, minute, second);
    
    this.latitude = latitude;
    this.longitude = longitude;
  }
  
  float getSolarHour(Calendar cal, float longitude) {
    // First, get the corresponding time in the GMT timezone
    Calendar gmt = (Calendar)cal.clone();
    gmt.add(Calendar.MILLISECOND, -cal.get(Calendar.ZONE_OFFSET));  // By subtracting the timezone offset
    gmt.add(Calendar.MILLISECOND, -cal.get(Calendar.DST_OFFSET));  // and subtracting any daylight savings offset
    
    float gmtSolarHour = gmt.get(Calendar.HOUR_OF_DAY) + gmt.get(Calendar.MINUTE)/60. + gmt.get(Calendar.SECOND)/3600. - 12;
    float longitudeOffset = longitude / 180 * 12;  // 180 degrees would be the other side of the world and therefore 12 hours off
    float solarHour = gmtSolarHour + longitudeOffset;
    
    while(solarHour < -12) solarHour += 24;
    
    return solarHour;
  }
  
  float solarDeclination(int dayNumber) {
    // Returns the solar declination on the given day of the year
    return radians(23.45) * sin(PI * (dayNumber - 81)/182.5);  // 81 is the day of the spring equinox
  }

  float getAltitude() {
    float t = PI/12 * getSolarHour(datetime, longitude);
    float declination = solarDeclination(datetime.get(Calendar.DAY_OF_YEAR));
    
    // Now the big equation...
    return asin(sin(radians(latitude))*sin(declination) + cos(radians(latitude))*cos(declination)*cos(t));
  }
  
  float getAzimuth() {    
    float t = PI/12 * getSolarHour(datetime, longitude);
    float declination = solarDeclination(datetime.get(Calendar.DAY_OF_YEAR));
    
    // Now the big equation...
    float offset = (cos(radians(latitude))*sin(declination) - sin(radians(latitude))*cos(declination)*cos(t)) > 0 ? PI : 0;
    return offset +  atan(cos(declination) * sin(t) / (cos(radians(latitude))*sin(declination) - sin(radians(latitude))*cos(declination)*cos(t)));
  }  
}

