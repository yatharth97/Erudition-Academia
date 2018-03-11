<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
$(document).ready(function(){
    $("#btn1").click(function(){
        $("#accordion").append($("#a_panel"));
    });
</script>

</head>
<body>
<div class="container">
<jsp:include page="navbar_public.jsp" />
	<h2>Machine Learning</h2>
	<hr>
	<p>
	Because of new computing technologies, machine learning today is not like machine learning of the past. It was born from pattern recognition and the theory that computers can learn without being programmed to perform specific tasks; researchers interested in artificial intelligence wanted to see if computers could learn from data. The iterative aspect of machine learning is important because as models are exposed to new data, they are able to independently adapt. They learn from previous computations to produce reliable, repeatable decisions and results. It’s a science that’s not new – but one that has gained fresh momentum.
While many machine learning algorithms have been around for a long time, the ability to automatically apply complex mathematical calculations to big data – over and over, faster and faster – is a recent development. Here are a few widely publicized examples of machine learning applications you may be familiar with:

The heavily hyped, self-driving Google car? The essence of machine learning.
Online recommendation offers such as those from Amazon and Netflix? Machine learning applications for everyday life.
Knowing what customers are saying about you on Twitter? Machine learning combined with linguistic rule creation.
Fraud detection? One of the more obvious, important uses in our world today.
	
	</p>
<div class="panel-group" id="accordion">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        
        Week 1
      </h4>
    </div>
    
      <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
      sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
      minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
      commodo consequat.
      </div>
  </div>

  <div class="panel panel-default" id="a_panel">
    <div class="panel-heading">
      <h4 class="panel-title">
        Week 2
      </h4>
    </div>
      <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
      sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
      minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
      commodo consequat.
      </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        Week 3
      </h4>
    </div>
      <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
      sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
      minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
      commodo consequat.</div>
  </div>
    <button id="btn1">Append text</button>

<table class="table table-bordered">
<tbody><tr><td>How to Pass:</td>
    <td>Pass all graded assignments to complete the course.</td>
</tr>
<tr>
<td>
	Language
</td>
<td>English</td>
</tr>
<tr>
<td>Fee</td>
<td>400 INR</td>
</tr>
</tbody>
</table>
</div>
</body>
</html>
