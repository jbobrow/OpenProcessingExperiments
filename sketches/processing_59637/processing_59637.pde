
String[] data;
int demoLength = 10;// data.length
ArrayList<Album> albums = null;
int xmargin = 30;
int ymargin = 30;
int spacing = 20;
float yscale = 1.5f;
PFont f = createFont("Arial", 16, true);

void setup(){ 
 background(0);
 size(1400, 600);
 data = loadStrings("iTunesData.csv");
 albums = new ArrayList<Album>(); 
 for (int i = 1; i < data.length; i++) {
 String[] bits = split(data[i], ","); // split at the comma
 String pstring = trim(bits[21]);// first, trim the spaces of play
 String albumName = trim(bits[3]);// trim the album string
 int playTimes = PApplet.parseInt(pstring);// convert to an integer
 Album album = new Album(albumName, playTimes);
 albums.add(album);		 
	}
}


void draw(){
 	background(0);
	smooth(); 
	int colspacing = 20;
	fill(255, 255, 255);
	stroke(120); 
	int rowspacing = 20;
	
	for (int i = 0; i < albums.size(); i++) {
		Album album = albums.get(i);
		int x = xmargin + i * colspacing;
		int y = ymargin + albums.get(i).playTimes * rowspacing;
		albums.get(i).setEllipse(x, y);
                noStroke();
                fill(227, 123, 164, album.playTimes*10); 
		ellipse(album.locationX, album.locationY, album.playTimes*1.25,
				album.playTimes*1.25);
	}
	 
	for (int i = 0; i < albums.size(); i++) {
		Album album = albums.get(i);
		if (album.isInMe(mouseX, mouseY)) {
			textFont(f, 16); //   Specify font to be used
			fill(227, 123, 164); //   Specify font color
			text(album.albumName, mouseX, mouseY); //  Display Text
			return;
		}
	}
}



class Album {

	public String albumName;
	public int playTimes;
	private int locationX;
	private int locationY;

	public Album(String albumName, int playTimes) {
		this.albumName = albumName;
		this.playTimes = playTimes;
	}

	public void setEllipse(int x, int y) {
		this.locationX = x;
		this.locationY = y;
	}

	 
	public boolean isInMe(int mouseX, int mouseY) {
		
		int x = mouseX - locationX;
		int y = mouseY - locationY;
		if((x*x + y*y)<this.playTimes*playTimes){
			return true;
		}
		return false;
	}

}

