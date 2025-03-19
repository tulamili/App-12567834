use ExtUtils::MakeMaker;

WriteMakefile (
  NAME            => 'App::bookletps' ,
  VERSION_FROM    => 'bookletps.pm' , 
  EXE_FILES => [ 'bookletps' ] ,
  AUTHOR => 'Toshiyuki SHIMONO (bin4tsv at gmail.com)' , 
  LICENSE => 'perl_5' ,
  META_MERGE => {
      'meta-spec' => { version => 2 },
       resources => {
           repository => {
               type => 'git',
               url  => 'https://github.com/tulamili/App-bookletps.git',
               web  => 'https://github.com/tulamili/App-bookletps',
           },
           bugtracker => {
               web => 'https://github.com/tulamili/App-bookletps/issues'
           },
       },
  },
) ;

