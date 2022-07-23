import processing.pdf.*;
import processing.svg.*;

void setup() {
  size(400, 400);
  background(255);
  stroke(0);
  noLoop();
  smooth(10);
  // beginRecord(PDF, "filename.pdf");
  
}

void draw() {
  beginRecord(SVG, "circles.svg");
  for (int diameter = 300; diameter >= 5; diameter -= 5)
  {
    circle(200, 200, diameter);
  }
  endRecord();

  beginRecord(SVG, "lines.svg");
  for (int y = 40; y <= 360; y += 5)
  {
    line(40, y, 360, y);
  }
  endRecord();


  saveFrame("moire_straight.png");
  
}
