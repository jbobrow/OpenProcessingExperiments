
/* Daniel Shiffman               */
/* Programming from A to Z       */
/* Spring 2006                   */
/* http://www.shiffman.net       */
/* daniel.shiffman@nyu.edu       */

// A Simple Thread example
// Reads information from an XML feed every so often
// occuring to the "wait" variable

import java.util.ArrayList;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
/*import a2z.*;                  // Lookie, our code is a Processing library!*/

public class RetrieveData extends Thread {
	
  private boolean running;			// Is the thread running?  Yes or no?
  private int wait;					// How many milliseconds should we wait in between executions?
  private ArrayList love_tweets;
private ArrayList hate_tweets;  
private long love_since_id;
  private long hate_since_id;
  private int love_count;
  private int hate_count;
  private boolean available;		// Is new news available?

/* Twitter url stuff */
String search_url = "http://search.twitter.com/search.atom";
String search_parameter = "?q=";
String since_id_parameter = "&since_id=";

  // Constructor, create the thread
  // It is not running by default
  public RetrieveData (int w, int total){
    wait = w;
    running = false;
    available = false;
    love_tweets = new ArrayList();
	hate_tweets = new ArrayList();
	love_since_id = 0;
	hate_since_id = 0;
    love_count = 0;
	hate_count = 0;
  }

  // Overriding "start()"
  public void start ()
  {
    // Set running equal to true
    running = true;
    // Print messages
    System.out.println("Starting thread (will execute every " + (wait/1000) + " seconds.)"); 
    // Do whatever start does in Thread, don't forget this!
    super.start();
  }


  // We must implement run, this gets triggered by start()
  public void run ()
  {
    while (running){
      System.out.println("reloading. . ."); 
      check();
      // Ok, let's wait for however long we should wait
      try {
        sleep((long)(wait));
      } 
      catch (Exception e) {
      }
    }
  }


  // Our method that quits the thread
  public void quit()
  {
    System.out.println("Quitting."); 
    running = false;  // Setting running to false ends the loop in run()
    // We used to need to call super.stop()
    // We don't any more since it is deprecated, see: http://java.sun.com/j2se/1.5.0/docs/guide/misc/threadPrimitiveDeprecation.html
    // super.stop();
    // Instead, we use interrupt, in case the thread is waiting. . .
    super.interrupt();
  }

  public boolean available() {
    return available;
  }
  public synchronized ArrayList getLoveTweets() {
    // We should put a while (!available) loop here
    // but since we are explicitly only calling this function if available is true, we're ok
    available = false;
    notifyAll(); // let's notify everyone that available has changed
    return love_tweets;     
  }
  public synchronized ArrayList getHateTweets() {
    // We should put a while (!available) loop here
    // but since we are explicitly only calling this function if available is true, we're ok
    available = false;
    notifyAll(); // let's notify everyone that available has changed
    return hate_tweets;     
  }
  public synchronized long getLoveSinceId() {
    // We should put a while (!available) loop here
    // but since we are explicitly only calling this function if available is true, we're ok
    available = false;
    notifyAll(); // let's notify everyone that available has changed
    return love_since_id;     
  }
  public synchronized long getHateSinceId() {
    // We should put a while (!available) loop here
    // but since we are explicitly only calling this function if available is true, we're ok
    available = false;
    notifyAll(); // let's notify everyone that available has changed
    return hate_since_id;     
  }
  public synchronized int getLoveCount() {
    // We should put a while (!available) loop here
    // but since we are explicitly only calling this function if available is true, we're ok
    available = false;
    notifyAll(); // let's notify everyone that available has changed
    return love_count;     
  }
  public synchronized int getHateCount() {
    // We should put a while (!available) loop here
    // but since we are explicitly only calling this function if available is true, we're ok
    available = false;
    notifyAll(); // let's notify everyone that available has changed
    return hate_count;     
  }
  public synchronized String getLatestLoveTweet() {
    // We should put a while (!available) loop here
    // but since we are explicitly only calling this function if available is true, we're ok
    available = false;
    notifyAll(); // let's notify everyone that available has changed
    String to_return = "";
    if (love_tweets.size() > 0) {
      to_return = (String)love_tweets.get(love_tweets.size() - 1);
    }
    return to_return;
  }
  public synchronized String getLatestHateTweet() {
    // We should put a while (!available) loop here
    // but since we are explicitly only calling this function if available is true, we're ok
    available = false;
    notifyAll(); // let's notify everyone that available has changed
    String to_return = "";
    if (hate_tweets.size() > 0) {
      to_return = (String)hate_tweets.get(hate_tweets.size() - 1);
    }
    return to_return;
  }

	private String constructUrl(String search_string, long since_id, int page) {
		String url = search_url;

		if (search_string != null){
			url += search_parameter + search_string;
		}
		if (since_id != 0){
			url += since_id_parameter + since_id;	
		}
		if (since_id != 0){
			url += "&page=" + page;	
		}

		return url + "&rpp=500";
	}



  private synchronized void check() {
    love_tweets = new ArrayList();
	hate_tweets = new ArrayList();


	String love_url = constructUrl("love", love_since_id, 1);
	println("\n\n\n\ntwitter-api-visualization::method() love_url " + love_url);
	String hate_url = constructUrl("hate", hate_since_id, 1);
	println("\n\n\n\ntwitter-api-visualization::method() hate_url " + hate_url);
	try {
		
		XMLElement love_xml = new XMLElement(new PApplet(),love_url);
		XMLElement hate_xml = new XMLElement(new PApplet(),hate_url);

	int num_love_children = love_xml.getChildCount();
	
	int num_hate_children = hate_xml.getChildCount();
	
	/*show errors*/
	println("love_errors: " + love_xml.getStringAttribute("error"));
	println("hate_errors: " + love_xml.getStringAttribute("error"));
	
	for (int pages = 2; pages<8; pages++){
		
		/*retrieve tweets*/
		for (int i = 0; i<num_love_children; i++){
			XMLElement child = love_xml.getChild(i);

			if (child.getChildCount() > 0){
				/*println("child has child " + child);			*/

				// get id and update since_id
				long id = Long.parseLong(split(child.getChild("id").getContent(), ":")[2]);
				println("id " + id);
				if (id > love_since_id) love_since_id = id;

				// get content
				println("title " + child.getChild("title").getContent() + "\n");
				love_tweets.add(child.getChild("title").getContent());
				love_count++;
			}
		}

		for (int i = 0; i<num_hate_children; i++){
			XMLElement child = hate_xml.getChild(i);

			if (child.getChildCount() > 0){
				/*println("child has child " + child);			*/

				// get id and update since_id
				long id = Long.parseLong(split(child.getChild("id").getContent(), ":")[2]);
				println("id " + id);
				if (id > hate_since_id) hate_since_id = id;

				// get content
				println("content " + child.getChild("title").getContent() + "\n");
				hate_tweets.add(child.getChild("title").getContent());
				hate_count++;
			}
		}
		
		love_url = constructUrl("love", love_since_id, pages);
		println("\n\n\n\ntwitter-api-visualization::method() love_url " + love_url);
		hate_url = constructUrl("hate", hate_since_id, pages);
		println("\n\n\n\ntwitter-api-visualization::method() hate_url " + hate_url);
	}
	
	/*retrieve tweets*/
	for (int i = 0; i<num_love_children; i++){
		XMLElement child = love_xml.getChild(i);
		
		if (child.getChildCount() > 0){
			/*println("child has child " + child);			*/
			
			// get id and update since_id
			long id = Long.parseLong(split(child.getChild("id").getContent(), ":")[2]);
			println("id " + id);
			if (id > love_since_id) love_since_id = id;
			
			// get content
			println("content " + child.getChild("title").getContent() + "\n");
			love_tweets.add(child.getChild("title").getContent());
			love_count++;
		}
	}
	
	for (int i = 0; i<num_hate_children; i++){
		XMLElement child = hate_xml.getChild(i);
		
		if (child.getChildCount() > 0){
			/*println("child has child " + child);			*/
			
			// get id and update since_id
			long id = Long.parseLong(split(child.getChild("id").getContent(), ":")[2]);
			println("id " + id);
			if (id > hate_since_id) hate_since_id = id;
			
			// get content
			println("content " + child.getChild("title").getContent() + "\n");
			hate_tweets.add(child.getChild("title").getContent());
			hate_count++;
		}
	}
	
	} catch (Exception e) {
		println("RetrieveData::method() " + e + "\n");
		println("Probably retrieved all we could for today");		
	}
	
	println("love count " + love_count);
	println("hate count " + hate_count);
	
	available = true;
	notifyAll();  // let's notify everyone that the headlines have been updated
  }
}

