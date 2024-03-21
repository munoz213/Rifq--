class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Welcome to Rifq!",
    image: "assets/images/image1.png",
    desc:
        "Your trusted companion for reuniting lost pets and finding loving homes.",
  ),
  OnboardingContents(
    title: "Find or Lost a Pet!",
    image: "assets/images/image2.png",
    desc:
        "Whether you've lost a pet or found one, we're here to help. Search for lost pets or post an advertisement to reunite them with their families.",
  ),
  OnboardingContents(
    title: "Nearby Assistance",
    image: "assets/images/image3.png",
    desc:
        "Quickly locate shelters and veterinary clinics in your area. We're here to provide support and care for all pets in need.",
  ),
  OnboardingContents(
    title: "Let's Get Started!",
    image: "assets/images/image4.png",
    desc:
        "Join our community of pet lovers and make a difference in the lives of animals. Together, we can save pets and create happier endings.",
  ),
];
