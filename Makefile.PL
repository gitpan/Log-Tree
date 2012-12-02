
use strict;
use warnings;

use 5.010_000;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "lightweight but highly configurable logging class",
  "AUTHOR" => "Dominik Schulz <dominik.schulz\@gauner.org>",
  "BUILD_REQUIRES" => {
    "Test::More" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Log-Tree",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Log::Tree",
  "PREREQ_PM" => {
    "Data::Tree" => 0,
    "English" => 0,
    "IO::Interactive" => 0,
    "Log::Dispatch" => 0,
    "Log::Dispatch::Email::MailSender" => 0,
    "Log::Dispatch::File::Locked" => 0,
    "Log::Dispatch::Screen" => 0,
    "Log::Dispatch::Syslog" => 0,
    "Moose" => 0,
    "Moose::Role" => 0,
    "feature" => 0,
    "mro" => 0,
    "namespace::autoclean" => 0
  },
  "VERSION" => "0.15",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



