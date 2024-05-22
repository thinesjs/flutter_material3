enum CacheEnums {
  login('login'),
  onboarding('onboardingPassed'),
  token('token');

  final String path;
  const CacheEnums(this.path);
}