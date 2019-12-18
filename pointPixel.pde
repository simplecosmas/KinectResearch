// Single-Pixel Estimation for Enhanced Object Detection and Recognition with Kinect for Windows V2

import org.openkinect.processing.*;

// The kinect class
KinectTracker tracker;



void setup() {
  //size(640, 520);
  size(500, 500);

  tracker = new KinectTracker(this);
}

void draw() {
  background(255);

  // Run the tracking analysis
  tracker.track();
  // Show the image
  tracker.display();

  // drawing the raw location
  PVector v1 = tracker.getPos();
  fill(50, 100, 250, 200);
  noStroke();
  ellipse(v1.x, v1.y, 20, 20);

  // Let's draw the "lerped" location
  PVector v2 = tracker.getLerpedPos();
  fill(100, 250, 50, 200);
  noStroke();
  ellipse(v2.x, v2.y, 20, 20);
  
  int loc = int(v2.x);
  int loc2 = int(v2.y);
  print(loc);
  print(loc2);
  
  // if it is less then 500
  if (loc<250){
    print("Right");
    }
    else{
    print("Left");
    }
    if (loc2<250){
    print("Top");
    }
    else{
    print("Bottom");
    }
  
  
  // Display some info
  int t = tracker.getThreshold();
  fill(0);
  text("threshold: " + t + "    " +  "framerate: " + int(frameRate) + "    " +
    "UP increase threshold, DOWN decrease threshold", 10, 500);
}

// Adjust the threshold with key presses
void keyPressed() {
  int t = tracker.getThreshold();
  if (key == CODED) {
    if (keyCode == UP) {
      t +=5;
      tracker.setThreshold(t);
    } else if (keyCode == DOWN) {
      t -=5;
      tracker.setThreshold(t);
    }
  }
}
