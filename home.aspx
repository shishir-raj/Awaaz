<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Project_Awaaz.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--in placeholder 1--%>
    <%--place anything before the header part--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--in placeholder2
    place between the header and footer--%>
<body>
	<div id="wrapper">
       
		<!-- Banner -->
			<section id="banner">
				<div id="logo"><img src="/static/lyv/images/awaaz_logo.png" alt="logo"/></div>
				<h2>Project Awaaz</h2>
				<p>Let's co-create the world's largest repository of audiobooks in Indian languages, for the visually impaired</p>
				<ul class="actions">
					<li>
						<a href="/choose" class="button big">Record Now</a>
					</li>
				</ul>
			</section>

		<!-- Two -->
			<section id="two" class="wrapper style2 special">
				<div class="container">
					<div class="row 150%">
						<div class="4u 12u$(medium)">
							<section class="box" style="border: 0; border-radius: 0px;">
								<img class="icon big rounded" style="border-radius: 0%; width:5em; height:5em; background-color: transparent;" src="/static/lyv/images/icons1.svg">
								<h4>of all visually impaired Indians are kids<br/><br/></h4>
							</section>
						</div>
						<div class="4u 12u$(medium)">
							<section class="box" id="leftRightBorder">
								<img class="icon big rounded" style="border-radius: 0%; width:5em; height:5em; background-color: transparent; " src="/static/lyv/images/icons2.svg">
								<h4>of them are able to receive any education</h4>
							</section>
						</div>
						<div class="4u$ 12u$(medium)">
							<section class="box" style="border: 0;">
								<img class="icon big rounded" style="border-radius: 0%; width:5em; height:5em; background-color: transparent;" src="/static/lyv/images/icons3.svg">
								<h4>of all published literature is available as audiobooks</h4>
							</section>
						</div>
					</div>
					<header class="major">
						<p>
						Project Awaaz is a community based initiative to make the content more accessible for all.
						<br/>
						So what are you waiting for?
						<br/>
						Let's co-create a better world, one poem at a time.
						</p>
					</header>
<!-- 					<section class="profiles">
						<div class="row">
							<section class="3u 6u(medium) 12u$(xsmall) profile">
								<img src="/static/lyv/images/profile_placeholder.gif" alt="" />
								<h4>Lorem ipsum</h4>
								<p>Lorem ipsum dolor</p>
							</section>
							<section class="3u 6u$(medium) 12u$(xsmall) profile">
								<img src="/static/lyv/images/profile_placeholder.gif" alt="" />
								<h4>Voluptatem dolores</h4>
								<p>Ullam nihil repudi</p>
							</section>
							<section class="3u 6u(medium) 12u$(xsmall) profile">
								<img src="/static/lyv/images/profile_placeholder.gif" alt="" />
								<h4>Doloremque quo</h4>
								<p>Harum corrupti quia</p>
							</section>
							<section class="3u$ 6u$(medium) 12u$(xsmall) profile">
								<img src="/static/lyv/images/profile_placeholder.gif" alt="" />
								<h4>Voluptatem dicta</h4>
								<p>Et natus sapiente</p>
							</section>
						</div>
					</section> -->
					<footer>
						<ul class="actions">
							<li>
								<a href="/choose" class="button big">Get Started</a>
							</li>
						</ul>
					</footer>
				</div>
			</section>


		<!-- One -->
			<section id="one" class="wrapper style1 special">
				<div class="container">
					<header class="major">
						<h2>How it Works</h2>
						<p>Be the voice they hear, in just 3 easy steps!</p>
					</header>
					<div class="row 150%">
						<div class="4u 12u$(medium)">
							<section class="box">
								<i class="icon big rounded color1 fa-book"></i>
								<h3>Choose a book</h3>
								<p>Discover literature in its unadulterated form, the way it’s supposed to be. Choose from your favorite books, stories and poems in multiple languages and discover India’s most celebrated authors and so many hidden gems.</p>
							</section>
						</div>
						<div class="4u 12u$(medium)">
							<section class="box">
								<i class="icon big rounded color9 fa-microphone"></i>
								<h3>Record an audiobook</h3>
								<p>After having selected a piece of literature, hit *Record* and read the text out loud from your screen. Listen to your recording and record again if you’re not satisfied. Remember, quality first.<br/><br/></p>
							</section>
						</div>
						<div class="4u$ 12u$(medium)">
							<section class="box">
								<i class="icon big rounded color6 fa-heart"></i>
								<h3>Lend your voice</h3>
								<p>If satisfied with the recording, submit it to make it available for the millions of visually impaired people in India. Get notified about the impact that you create by taking out just a few minutes of your day. #LendYourVoice now!</p>
							</section>
						</div>
					</div>
				</div>
			</section>

			<!-- Four -->
			<section id="four" class="wrapper style2 special">
				<div class="container">
					<header class="major">
						<h2>In The News!</h2>
					</header>
					<div class="row uniform">
						<div class="6u 12u$(small)">
							<a href="http://epaper2.mid-day.com/epaper/11-jul-2016-252-edition-Mumbai-Page-25.html"><img src="/static/lyv/images/midday.png" alt="midday"/></a>
						</div>
						<div class="6u 12u$(small)">
							<a href="https://nearfox.com/explore/project-aawaaz"><img src="/static/lyv/images/nearfox.png" alt="nearfox"/></a>
						</div>
					</div>		
				</div>
			</section>

		
		<!-- Three -->
			<section id="three" class="wrapper style3 special">
				<div class="container">
					<header class="major">
						<h3>Got any feedback/suggestions? Get in touch!</h3>
					</header>
				</div>
				<div class="container 50%">
					<form id="feedbackform" action="/feedback" method="post">
						<div class="row uniform">
							<div class="6u 12u$(small)">
								<input name="name" id="name" value="" placeholder="Name" type="text">
							</div>
							<div class="6u$ 12u$(small)">
								<input name="email" id="email" value="" placeholder="Email" type="email">
							</div>
							<div class="12u$">
								<textarea name="message" id="message" placeholder="Message" rows="6"></textarea>
							</div>
							<div class="12u$">
								<ul class="actions">
									<li><input value="Send Message" class="special big" type="submit"></li>
								</ul>
							</div>
						</div>
					</form>
					<p id="thankyoumessage" style="visibility: hidden;">
						Thanks for the message! We will get back to you shortly.
					</p>
				</div>
			</section>
			<br/>
	</div>
	

	</body>


</asp:Content>
